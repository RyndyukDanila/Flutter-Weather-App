import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/location_controller.dart';
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
    return Consumer<LocationController>(
      builder: (context, LocationController locationNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Forecast Page"),
            actions: [
              IconButton(
                onPressed: () {
                  locationNotifier.getCurrentLocation();
                },
                icon: Icon(Icons.my_location_rounded),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
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
      },
    );
  }
}
