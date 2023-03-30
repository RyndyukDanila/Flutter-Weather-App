import 'package:flutter/material.dart';

import '../widgets/current_weather_widget.dart';
import '../widgets/day_weather_widget.dart';
import '../widgets/location_widget.dart';
import '../widgets/week_weather_widget.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forecast Page"),
      ),
      body: Container(
        child: ListView(
          children: [
            LocationWidget(),
            Divider(),
            CurrentWeatherWidget(),
            Divider(),
            DayWeatherWidget(),
            Divider(),
            WeekWeatherWidget(),
          ],
        ),
      ),
    );
  }
}
