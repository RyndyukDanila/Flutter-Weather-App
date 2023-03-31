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
  final LocationController _locationController = LocationController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocationController(),
      child: Consumer<LocationController>(
        builder: (context, LocationController locationNotifier, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Forecast Page"),
              actions: [
                IconButton(
                  onPressed: () {
                    _locationController.getPreferences();
                  },
                  icon: Icon(Icons.my_location_rounded),
                )
              ],
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
        },
      ),
    );
  }
}
