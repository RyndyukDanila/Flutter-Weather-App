import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../controller/forecast_controller.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastController>(
      builder: (context, ForecastController forecastNotifier, child) {
        return Column(
          children: [
            Text(
              forecastNotifier.address,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 48,
              ),
            ),
            Text(
              DateFormat.yMMMMd('en_US').format(DateTime.fromMillisecondsSinceEpoch(forecastNotifier.currentWeather.dt! * 1000)),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        );
      },
    );
  }
}
