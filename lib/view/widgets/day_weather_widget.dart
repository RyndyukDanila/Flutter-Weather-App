import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/forecast_controller.dart';
import 'utils/day_forecast_chart.dart';

class DayWeatherWidget extends StatefulWidget {
  const DayWeatherWidget({super.key});

  @override
  State<DayWeatherWidget> createState() => _DayWeatherWidgetState();
}

class _DayWeatherWidgetState extends State<DayWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastController>(
      builder: (context, ForecastController forecastNotifier, child) {
        return Column(
          children: [
            Text(
              'Day weather chart',
              style: TextStyle(fontSize: 24),
            ),
            AspectRatio(
              aspectRatio: 1.1,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 18,
                  left: 12,
                  top: 24,
                  bottom: 12,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    width: 1200,
                    child: LineChart(DayForecastChart(forecastNotifier.dayWeather, context)),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
