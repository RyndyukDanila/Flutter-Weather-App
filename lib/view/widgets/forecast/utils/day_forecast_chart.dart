import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../model/weather/hourly_weather.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 14,
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text('${value.toInt() % 24}:00', style: style),
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  var text = value > 0
      ? Text(
          '${value.toInt()}°'.toString(),
          style: TextStyle(
            fontSize: 14,
            color: Colors.amber.shade400,
          ),
          textAlign: TextAlign.left,
        )
      : Text(
          '${value.toInt()}°'.toString(),
          style: TextStyle(
            fontSize: 14,
            color: Colors.lightBlue,
          ),
          textAlign: TextAlign.left,
        );
  if (value == 0) {
    text = Text(
      '${value.toInt()}°'.toString(),
      style: TextStyle(
        fontSize: 14,
        color: Colors.purple,
      ),
      textAlign: TextAlign.left,
    );
  }

  return text;
}

LineChartData DayForecastChart(List<HourlyWeather> dayWeather, BuildContext context) {
  return LineChartData(
    maxY: () {
      var max = dayWeather[0].temp!;
      for (var hour in dayWeather.sublist(0, 24)) {
        if (max < hour.temp!) {
          max = hour.temp!;
        }
      }
      return max.toDouble() + 2;
    }(),
    minY: () {
      var min = dayWeather[0].temp!;
      for (var hour in dayWeather.sublist(0, 24)) {
        if (min > hour.temp!) {
          min = hour.temp!;
        }
      }
      return min.toDouble() - 2;
    }(),
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      drawHorizontalLine: true,
      horizontalInterval: 1,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return value == 0
            ? FlLine(
                color: Colors.purple.withOpacity(0.6),
                strokeWidth: 2,
              )
            : FlLine(
                color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.3),
                strokeWidth: 0.5,
              );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.3),
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: leftTitleWidgets,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(
        color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.3),
      ),
    ),
    lineBarsData: [
      LineChartBarData(
        spots: () {
          List<FlSpot> flspots = [];
          double firstHour =
              double.parse(DateFormat.H().format(DateTime.fromMillisecondsSinceEpoch(dayWeather[0].dt! * 1000)).substring(0, 2));
          for (var hourData in dayWeather.sublist(0, 24)) {
            double hour = double.parse(DateFormat.H().format(DateTime.fromMillisecondsSinceEpoch(hourData.dt! * 1000)).substring(0, 2));
            if (firstHour > hour) {
              hour += 24;
            }
            double temp = hourData.temp!.toDouble();
            flspots.add(FlSpot(hour, temp));
          }
          return flspots;
        }(),
        isCurved: true,
        color: Colors.purple.shade400,
        // gradient: LinearGradient(
        //   colors: [
        //     Colors.purple.shade200,
        //     Colors.purple.shade300,
        //     Colors.purple.shade400,
        //   ],
        // ),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(
          show: true,
          color: Colors.purple.shade400.withOpacity(0.3),
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.purple.shade200,
          //     Colors.purple.shade300,
          //     Colors.purple.shade400,
          //   ].map((color) => color.withOpacity(0.3)).toList(),
          // ),
        ),
      ),
    ],
  );
}
