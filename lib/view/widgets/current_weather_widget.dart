import 'package:flutter/material.dart';

class CurrentWeatherWidget extends StatefulWidget {
  const CurrentWeatherWidget({super.key});

  @override
  State<CurrentWeatherWidget> createState() => _CurrentWeatherWidgetState();
}

class _CurrentWeatherWidgetState extends State<CurrentWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Right now',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ListTile(
          title: Text('Weather icon'),
        ),
        Row(
          children: [
            Text('Wind speed icon'),
            Text('Clouds icon'),
            Text('Humidity icon'),
          ],
        )
      ],
    );
  }
}
