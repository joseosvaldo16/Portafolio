import 'package:flutter/material.dart';
import 'package:mp5/models/weathermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherView extends StatefulWidget {
  final Weather weather;

  const WeatherView({super.key, required this.weather});

  @override
  WeatherViewState createState() => WeatherViewState();
}

class WeatherViewState extends State<WeatherView> {
  String _unit = 'Metric';

  @override
  void initState() {
    super.initState();
    _loadUnitPreference();
  }

  _loadUnitPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _unit = prefs.getString('unit') ?? 'Metric';
    });
  }

  String _formattedTemperature(double temp) {
    if (_unit == 'Imperial') {
      // convert kelvin to fahrenheit
      return '${(temp * 9 / 5 - 459.67).toStringAsFixed(1)}°F';
    } else {
      // convert kelvin to celsius
      return '${(temp - 273.15).toStringAsFixed(1)}°C';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.weather.cityName, style: const TextStyle(fontSize: 24)),
            Text(_formattedTemperature(widget.weather.temperature),
                style: const TextStyle(fontSize: 50)),
            Text(widget.weather.description,
                style: const TextStyle(fontSize: 20)),
            Image.network(
                'http://openweathermap.org/img/w/${widget.weather.icon}.png'),
          ],
        ),
      ),
      backgroundColor: Colors.blue[100],
    );
  }
}
