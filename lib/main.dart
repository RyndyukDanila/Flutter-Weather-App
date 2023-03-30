import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_weather_app/controller/theme_controller.dart';

import 'view/screens/home_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: Consumer<ThemeController>(
        builder: (context, ThemeController themeNotifier, child) {
          return MaterialApp(
            title: 'Flutter Weather App',
            theme: themeNotifier.isDark
                ? ThemeData.dark()
                : ThemeData(primarySwatch: Colors.purple),
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
