import 'package:shared_preferences/shared_preferences.dart';

class LocationPreferences {
  static const locationLatitudePreferenceKey = "Location latitude";
  static const locationLongitudePreferenceKey = "Location longitude";

  setLocation(double latitude, double longitude) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setDouble(locationLatitudePreferenceKey, latitude);
    sharedPreferences.setDouble(locationLongitudePreferenceKey, longitude);
  }

  getLocation() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return <double?>[
      sharedPreferences.getDouble(locationLatitudePreferenceKey),
      sharedPreferences.getDouble(locationLongitudePreferenceKey),
    ];
  }
}
