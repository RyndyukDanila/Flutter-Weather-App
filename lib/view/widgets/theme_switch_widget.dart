import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/theme_controller.dart';

class ThemeSwitchWidget extends StatefulWidget {
  const ThemeSwitchWidget({super.key});

  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, ThemeController themeNotifier, child) {
        return Switch(
          value: themeNotifier.isDark,
          onChanged: (bool value) {
            themeNotifier.isDark = value;
          },
        );
      },
    );
  }
}
