import 'package:dio/dio.dart';

class WeatherService {
  final _dio = Dio();
  static const String _baseURL = 'https://api.openweathermap.org/data/2.5/onecall';
  static const String _apiKey = 'ba339bcb40c2a396dd39302e5af5016a';

  Future<Response> request(double latitude, double longitude) async {
    Response response = await _dio.get(
      "$_baseURL?lat=$latitude&lon=$longitude&units=metric&lang=en&exclude=minute,alerts&appid=$_apiKey",
    );
    return response;
  }
}
