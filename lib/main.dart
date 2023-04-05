import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_weather_app/controller/settings_controller.dart';

import 'controller/forecast_controller.dart';
import 'view/screens/home_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsController>(create: (_) => SettingsController()),
        ChangeNotifierProvider<ForecastController>(create: (_) => ForecastController()),
      ],
      child: Consumer<SettingsController>(
        builder: (context, SettingsController settingsNotifier, child) {
          return MaterialApp(
            title: 'Flutter Weather App',
            theme: settingsNotifier.isDark ? ThemeData.dark() : ThemeData(primarySwatch: Colors.purple),
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
