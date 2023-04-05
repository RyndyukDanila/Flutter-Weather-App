import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../controller/forecast_controller.dart';
import 'utils/day_details_widget.dart';

class DailyWeatherWidget extends StatefulWidget {
  const DailyWeatherWidget({super.key});

  @override
  State<DailyWeatherWidget> createState() => _DailyWeatherWidgetState();
}

class _DailyWeatherWidgetState extends State<DailyWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastController>(
      builder: (context, ForecastController forecastNotifier, child) {
        return Column(
          children: [
            const Text(
              'This week forecast',
              style: TextStyle(fontSize: 24),
            ),
            Container(
              height: 400,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).dividerColor,
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return DayDetailsWidget(
                    day: DateFormat('EEE, MMM d')
                        .format(DateTime.fromMillisecondsSinceEpoch(forecastNotifier.dailyWeather[index].dt! * 1000)),
                    icon: forecastNotifier.dailyWeather[index].weather![0].icon!,
                    desc: forecastNotifier.dailyWeather[index].weather![0].description!,
                    temp: forecastNotifier.dailyWeather[index].temp!,
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
