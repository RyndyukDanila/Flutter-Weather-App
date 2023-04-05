import 'package:flutter/material.dart';

import '../../../../model/weather/temp.dart';

class DayDetailsWidget extends StatelessWidget {
  final Temp temp;
  final String day;
  final String icon;
  final String desc;

  const DayDetailsWidget({super.key, required this.temp, required this.day, required this.icon, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 80,
                child: Text(day),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 30,
                height: 30,
                child: Image.asset('assets/weather/$icon.png'),
              ),
              Expanded(
                child: Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Text('${temp.max}°/${temp.min}°')
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
