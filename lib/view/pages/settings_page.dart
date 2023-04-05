import 'package:flutter/material.dart';

import '../widgets/settings/day_chart_switch_widget.dart';
import '../widgets/settings/theme_switch_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings Page"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          ListTile(
            title: Text('Use dark theme'),
            trailing: ThemeSwitchWidget(),
          ),
          ListTile(
            title: Text('Use day chart'),
            trailing: DayChartSwitchWidget(),
          )
        ],
      ),
    );
  }
}
