import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteCitiesModel with ChangeNotifier {
  List<String> _favoriteCities = [];

  List<String> get favoriteCities => _favoriteCities;

  FavoriteCitiesModel() {
    loadFavoriteCities();
  }

  void loadFavoriteCities() async {
    final prefs = await SharedPreferences.getInstance();
    _favoriteCities = prefs.getStringList('favoriteCities') ?? [];
    notifyListeners();
  }

  void addCity(String city) {
    if (!_favoriteCities.contains(city) && city.isNotEmpty) {
      _favoriteCities.add(city);
      _saveFavoriteCities();
      notifyListeners();
    }
  }

  void removeCity(String city) {
    _favoriteCities.remove(city);
    _saveFavoriteCities();
    notifyListeners();
  }

  void _saveFavoriteCities() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favoriteCities', _favoriteCities);
    notifyListeners();
  }
}
