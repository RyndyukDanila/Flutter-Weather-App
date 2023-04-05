import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/forecast_controller.dart';
import '../widgets/forecast/current_weather_widget.dart';
import '../widgets/forecast/hourly_weather_widget.dart';
import '../widgets/forecast/location_widget.dart';
import '../widgets/forecast/week_weather_widget.dart';

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
            title: const Text("Forecast Page"),
            actions: [
              IconButton(
                tooltip: 'Get your current location',
                onPressed: () {
                  forecastNotifier.getCurrentLocation();
                },
                icon: const Icon(Icons.my_location_rounded),
              )
            ],
          ),
          body: forecastNotifier.isLoading
              ? Container(
                  padding: const EdgeInsets.all(4.0),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(8.0),
                  children: const [
                    LocationWidget(),
                    Divider(),
                    CurrentWeatherWidget(),
                    Divider(),
                    HourlyWeatherWidget(),
                    Divider(),
                    WeekWeatherWidget(),
                  ],
                ),
        );
      },
    );
  }
}
