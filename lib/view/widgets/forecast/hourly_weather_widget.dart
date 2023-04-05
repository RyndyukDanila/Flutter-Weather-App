import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/settings_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../controller/forecast_controller.dart';
import 'utils/day_forecast_chart.dart';
import 'utils/hour_details_widget.dart';

class HourlyWeatherWidget extends StatefulWidget {
  const HourlyWeatherWidget({super.key});

  @override
  State<HourlyWeatherWidget> createState() => _HourlyWeatherWidgetState();
}

class _HourlyWeatherWidgetState extends State<HourlyWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ForecastController, SettingsController>(
      builder: (context, ForecastController forecastNotifier, SettingsController settingsNotifier, child) {
        return settingsNotifier.isDayChart
            ? Column(
                children: [
                  const Text(
                    'Today hourly forecast chart',
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
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                          width: 1200,
                          child: LineChart(DayForecastChart(forecastNotifier.hourlyWeather, context)),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  const Text(
                    'Today hourly forecast',
                    style: TextStyle(fontSize: 24),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: 150,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 16,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: 100,
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: HourDetailsWidget(
                              temp: forecastNotifier.hourlyWeather[index].temp!,
                              icon: forecastNotifier.hourlyWeather[index].weather![0].icon!,
                              hour: DateFormat('HH:mm')
                                  .format(DateTime.fromMillisecondsSinceEpoch(forecastNotifier.hourlyWeather[index].dt! * 1000)),
                              desc: forecastNotifier.hourlyWeather[index].weather![0].description!,
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              );
      },
    );
  }
}
