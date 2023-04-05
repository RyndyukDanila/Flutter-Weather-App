import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/forecast_controller.dart';

class WeekWeatherWidget extends StatefulWidget {
  const WeekWeatherWidget({super.key});

  @override
  State<WeekWeatherWidget> createState() => _WeekWeatherWidgetState();
}

class _WeekWeatherWidgetState extends State<WeekWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastController>(
      builder: (context, ForecastController forecastNotifier, child) {
        return Column(
          children: [
            Text(
              'This week',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Clear starting tomorrow, with highs in the 10 degrees all week.',
            ),
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Container(
                color: Colors.purple.shade100,
              ),
            ),
          ],
        );
      },
    );
  }
}
