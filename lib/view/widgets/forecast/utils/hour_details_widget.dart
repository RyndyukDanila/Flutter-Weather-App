import 'package:flutter/material.dart';

class HourDetailsWidget extends StatelessWidget {
  final int temp;
  final String icon;
  final String hour;
  final String desc;

  const HourDetailsWidget({super.key, required this.temp, required this.icon, required this.hour, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(hour),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          width: 40,
          height: 40,
          child: Image.asset('assets/weather/$icon.png'),
        ),
        Text(
          desc,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text('$temp°'),
        )
      ],
    );
  }
}
