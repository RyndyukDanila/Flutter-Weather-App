import 'package:flutter/material.dart';

import '../model/settings_preferences.dart';

class SettingsController extends ChangeNotifier {
  late SettingsPreferences preferences;
  late bool isDark;
  late bool isDayChart;

  SettingsController() {
    isDark = false;
    isDayChart = false;
    preferences = SettingsPreferences();
    getPreferences();
  }

  setDarkTheme(bool value) {
    isDark = value;
    preferences.setTheme(value);
    notifyListeners();
  }

  setDayChart(bool value) {
    isDayChart = value;
    preferences.setDayChart(value);
    notifyListeners();
  }

  getPreferences() async {
    isDark = await preferences.getTheme();
    isDayChart = await preferences.getDayChart();
    notifyListeners();
  }
}
