import 'package:shared_preferences/shared_preferences.dart';

class SettingsPreferences {
  static const themePreferenceKey = 'Dark theme';
  static const chartPreferenceKey = 'Day chart';

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(themePreferenceKey, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(themePreferenceKey) ?? false;
  }

  setDayChart(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(chartPreferenceKey, value);
  }

  getDayChart() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(chartPreferenceKey) ?? false;
  }
}
