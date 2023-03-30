import 'package:flutter/material.dart';

class DayWeatherWidget extends StatefulWidget {
  const DayWeatherWidget({super.key});

  @override
  State<DayWeatherWidget> createState() => _DayWeatherWidgetState();
}

class _DayWeatherWidgetState extends State<DayWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Today',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'Partly cloudy tonight. Tommorow will be colder and mostly clear.',
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
  }
}
