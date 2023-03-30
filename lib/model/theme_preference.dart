import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const themePreferenceKey = "Dark theme preference";

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(themePreferenceKey, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(themePreferenceKey) ?? false;
  }
}
