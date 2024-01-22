import 'package:flutter/material.dart';
import 'package:mp5/Views/app.dart';
import 'package:mp5/models/favoritecitiesmodel.dart';
import 'package:mp5/uitls/weatherdata.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherData()),
        ChangeNotifierProvider(create: (context) => FavoriteCitiesModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      home: MyWeatherApp(),
    );
  }
}
