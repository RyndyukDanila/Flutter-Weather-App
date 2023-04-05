import 'temp.dart';
import 'weather.dart';

class DailyWeather {
  int? dt;
  Temp? temp;
  List<Weather>? weather;

  DailyWeather({
    this.dt,
    this.temp,
    this.weather,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) => DailyWeather(
        dt: json['dt'] as int?,
        temp: json['temp'] == null ? null : Temp.fromJson(json['temp'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>?)?.map((e) => Weather.fromJson(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'temp': temp?.toJson(),
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}
