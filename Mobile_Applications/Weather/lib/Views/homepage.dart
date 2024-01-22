import 'package:flutter/material.dart';
import 'package:mp5/Views/weatherview.dart';
import 'package:mp5/models/favoritecitiesmodel.dart';
import 'package:mp5/models/weathermodel.dart';
import 'package:mp5/uitls/weatherapi.dart';
import 'package:mp5/uitls/weatherdata.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  FavoriteCitiesModel? favoriteCitiesModel;
  int _currentIndex = 0; // define _currentIndex
  final WeatherApi _weatherApi = WeatherApi(); // define _weatherApi

  @override
  void initState() {
    super.initState();
    // load weather data after the frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadWeatherData());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final model = Provider.of<FavoriteCitiesModel>(context, listen: false);
    if (favoriteCitiesModel != model) {
      favoriteCitiesModel?.removeListener(_loadWeatherData);
      favoriteCitiesModel = model;
      favoriteCitiesModel!.addListener(_loadWeatherData);
    }
  }

  @override
  void dispose() {
    // remove the listener when the widget is disposed
    favoriteCitiesModel?.removeListener(_loadWeatherData);
    super.dispose();
  }

  // load weather data for favorite cities
  _loadWeatherData() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    if (favoriteCitiesModel != null &&
        favoriteCitiesModel!.favoriteCities.isNotEmpty) {
      try {
        List<Weather> weatherList = [];
        for (var city in favoriteCitiesModel!.favoriteCities) {
          final data = await _weatherApi.getCityWeather(city);
          weatherList.add(Weather.fromJson(data));
        }
        final weatherData = Provider.of<WeatherData>(context, listen: false);
        weatherData.updateWeatherList(weatherList);
      } catch (e) {
        scaffoldMessenger.showSnackBar(
          SnackBar(content: Text('Failed to load weather data: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherData>(context); // define weatherData
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: Scaffold(
        appBar: AppBar(
          title: weatherData.weatherList.isNotEmpty
              ? Text(
                  'Weather in ${weatherData.weatherList[_currentIndex].cityName}')
              : const Text('Loading...'),
          backgroundColor: Colors.blue,
          // add a button to refresh weather data
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _loadWeatherData,
            ),
          ],
        ),
        body: weatherData.weatherList.isNotEmpty
            ? Column(
                children: <Widget>[
                  Expanded(
                    child: PageView.builder(
                      itemCount: weatherData.weatherList.length,
                      onPageChanged: (index) =>
                          setState(() => _currentIndex = index),
                      itemBuilder: (context, index) =>
                          WeatherView(weather: weatherData.weatherList[index]),
                    ),
                  ),
                  _buildPageIndicator(weatherData),
                ],
              )
            : const Center(
                child: Text(
                    'No favorite cities added. Go to Favorites to add cities.')),
      ),
    );
  }

  Widget _buildPageIndicator(WeatherData weatherData) {
    // define _buildPageIndicator
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        weatherData.weatherList.length,
        (index) => Container(
          margin: const EdgeInsets.all(4.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index
                ? Colors.blue
                : Colors.blue.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
