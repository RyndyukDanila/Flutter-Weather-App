import 'weather.dart';

class HourlyWeather {
  int? dt;
  int? temp;
  List<Weather>? weather;

  HourlyWeather({
    this.dt,
    this.temp,
    this.weather,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) => HourlyWeather(
        dt: json['dt'] as int?,
        temp: (json['temp'] as num?)?.round(),
        weather: (json['weather'] as List<dynamic>?)?.map((e) => Weather.fromJson(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'temp': temp,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}
