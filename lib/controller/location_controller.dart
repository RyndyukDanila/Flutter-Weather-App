import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/tab.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends ChangeNotifier {
  late List<double> coordinates;
  late String address;
  bool isLoading = false;

  LocationController() {
    getCurrentLocation();
  }

  getCurrentLocation() async {
    isLoading = true;
    notifyListeners();

    Position pos = await _determinePosition();
    coordinates = [pos.latitude, pos.longitude];

    await getAddress(latitude: coordinates[0], longitude: coordinates[1]);

    isLoading = false;
    notifyListeners();
  }

  getLocation({required String name}) async {
    isLoading = true;
    notifyListeners();

    address = name;
    List<Location> locations = await locationFromAddress(name);
    Location location = locations[0];
    coordinates = [location.latitude, location.longitude];

    isLoading = false;
    notifyListeners();
  }

  getAddress({required double latitude, required double longitude}) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    address = place.locality!;
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
}
