import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/settings_controller.dart';

class DayChartSwitchWidget extends StatefulWidget {
  const DayChartSwitchWidget({super.key});

  @override
  State<DayChartSwitchWidget> createState() => _DayChartSwitchWidgetState();
}

class _DayChartSwitchWidgetState extends State<DayChartSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (context, SettingsController settingsNotifier, child) {
        return Switch(
          value: settingsNotifier.isDayChart,
          onChanged: (bool value) {
            settingsNotifier.setDayChart(value);
          },
        );
      },
    );
  }
}
