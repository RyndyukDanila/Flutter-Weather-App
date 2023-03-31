import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../model/location_preferences.dart';

class LocationController extends ChangeNotifier {
  late LocationPreferences _preferences;
  List<double?> coordinates = [null, null];

  LocationController() {
    _preferences = LocationPreferences();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  setCoordinates(double latitude, double longitude) {
    coordinates = [latitude, longitude];
    _preferences.setLocation(latitude, longitude);
    notifyListeners();
  }

  getPreferences() async {
    coordinates = await _preferences.getLocation();
    if (coordinates[1] == null) {
      Position pos = await _determinePosition();
      setCoordinates(pos.latitude, pos.longitude);
    }
    notifyListeners();
  }

  getCurrentLocation() async {
    Position pos = await _determinePosition();
    setCoordinates(pos.latitude, pos.longitude);
    notifyListeners();
  }
}
