import 'package:flutter/foundation.dart';
import 'package:mp5/models/weathermodel.dart';

class WeatherData extends ChangeNotifier {
  List<Weather> _weatherList = [];

  List<Weather> get weatherList => _weatherList;

  void updateWeatherList(List<Weather> newWeatherList) {
    _weatherList = newWeatherList;
    notifyListeners();
  }
}
