import 'package:flutter/material.dart';

import '../../model/tab.dart';
import '../pages/forecast_page.dart';
import '../pages/locations_page.dart';
import '../pages/settings_page.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {super.key,
      required this.navigatorKey,
      required this.tabItem,
      required this.selectTabFunction});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;
  final Function selectTabFunction;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        Widget currentPage;
        if (tabItem == TabItem.FORECAST) {
          currentPage = ForecastPage();
        } else if (tabItem == TabItem.LOCATIONS) {
          currentPage = LocationsPage(onTapCityFunction: selectTabFunction);
        } else {
          currentPage = SettingsPage();
        }
        return MaterialPageRoute(builder: (context) => currentPage);
      },
    );
  }
}
