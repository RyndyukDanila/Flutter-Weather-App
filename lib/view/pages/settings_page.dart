import 'package:flutter/material.dart';
import 'package:flutter_weather_app/view/widgets/theme_switch_widget.dart';

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
        title: Text("Settings Page"),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          ListTile(
            title: Text('Use dark theme'),
            trailing: ThemeSwitchWidget(),
          ),
        ],
      ),
    );
  }
}
