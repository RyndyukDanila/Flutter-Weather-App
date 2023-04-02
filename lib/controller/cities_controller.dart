import 'package:flutter/material.dart';

import '../model/cities_preferences.dart';

class CitiesController extends ChangeNotifier {
  List<String> cities = ['London'];
  String? selectedCity = null;
  late CitiesPreferences _preferences;

  CitiesController() {
    _preferences = CitiesPreferences();
    getPreferences();
  }

  getPreferences() async {
    cities = await _preferences.getCities();
    notifyListeners();
  }

  void selectCity(int index) {
    selectedCity = cities[index];
    notifyListeners();
  }

  void addCityItem(String city) {
    cities.add(city);
    _preferences.setCities(cities);
    notifyListeners();
  }

  void handleCityDelete(String city) {
    cities.remove(city);
    _preferences.setCities(cities);
    if (selectedCity == city) {
      selectedCity = null;
    }
    notifyListeners();
  }

  void reorderCitites(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final String item = cities.removeAt(oldIndex);
    cities.insert(newIndex, item);
    _preferences.setCities(cities);
    notifyListeners();
  }
}
