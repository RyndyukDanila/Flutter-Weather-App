import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/theme_controller.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, ThemeController themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Settings Page"),
          ),
          body: IconButton(
            icon: Icon(
                themeNotifier.isDark ? Icons.nightlight_round : Icons.wb_sunny),
            onPressed: () {
              themeNotifier.isDark
                  ? themeNotifier.isDark = false
                  : themeNotifier.isDark = true;
            },
          ),
        );
      },
    );
  }
}
