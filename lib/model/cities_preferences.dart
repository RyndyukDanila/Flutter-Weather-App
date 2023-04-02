import 'package:shared_preferences/shared_preferences.dart';

class CitiesPreferences {
  static const citiesPreferenceKey = "Cities";

  setCities(List<String> list) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(citiesPreferenceKey, list);
  }

  Future<List<String>> getCities() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(citiesPreferenceKey) ?? [];
  }
}
