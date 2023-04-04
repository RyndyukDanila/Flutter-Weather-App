import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/forecast_controller.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/day_weather_widget.dart';
import '../widgets/location_widget.dart';
import '../widgets/week_weather_widget.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastController>(
      builder: (context, ForecastController forecastNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Forecast Page"),
            actions: [
              IconButton(
                tooltip: 'Get your current location',
                onPressed: () {
                  forecastNotifier.getCurrentLocation();
                },
                icon: Icon(Icons.my_location_rounded),
              )
            ],
          ),
          body: forecastNotifier.isLoading
              ? Container(
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView(
                  padding: EdgeInsets.all(8.0),
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
        );
      },
    );
  }
}
