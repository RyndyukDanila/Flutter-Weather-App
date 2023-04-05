import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/model/weather/hourly_weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../model/weather/current_weather.dart';
import 'utils/api_service.dart';

class ForecastController extends ChangeNotifier {
  late List<double> coordinates;
  late String address;
  bool isLoading = true;

  final weatherService = WeatherService();
  late CurrentWeather currentWeather;
  late List<HourlyWeather> hourlyWeather;

  ForecastController() {
    getCurrentLocation();
  }

  getCurrentLocation() async {
    isLoading = true;
    notifyListeners();

    Position pos = await _determinePosition();
    coordinates = [pos.latitude, pos.longitude];

    await getAddress(latitude: coordinates[0], longitude: coordinates[1]);

    getWeatherData();
  }

  getLocation({required String name}) async {
    isLoading = true;
    notifyListeners();

    address = name;
    List<Location> locations = await locationFromAddress(name);
    Location location = locations[0];
    coordinates = [location.latitude, location.longitude];

    getWeatherData();
  }

  getAddress({required double latitude, required double longitude}) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      latitude,
      longitude,
      localeIdentifier: 'en_US',
    );
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
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  getWeatherData() async {
    Response result;
    result = await weatherService.request(coordinates[0], coordinates[1]);

    currentWeather = CurrentWeather.fromJson(result.data['current']);
    hourlyWeather = List<HourlyWeather>.from(result.data['hourly'].map((e) => HourlyWeather.fromJson(e)));

    isLoading = false;
    notifyListeners();
  }
}
