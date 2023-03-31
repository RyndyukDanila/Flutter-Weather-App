import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/location_controller.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationController>(
      builder: (context, LocationController locationNotifier, child) {
        return Text(
          locationNotifier.coordinates.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
