import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/settings_controller.dart';

class ThemeSwitchWidget extends StatefulWidget {
  const ThemeSwitchWidget({super.key});

  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (context, SettingsController settingsNotifier, child) {
        return Switch(
          value: settingsNotifier.isDark,
          onChanged: (bool value) {
            settingsNotifier.setDarkTheme(value);
          },
        );
      },
    );
  }
}
