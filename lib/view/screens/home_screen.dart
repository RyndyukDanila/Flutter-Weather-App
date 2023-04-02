import 'package:flutter/material.dart';

import '../../model/tab.dart';
import '../utils/bottom_navigation.dart';
import '../utils/tab_navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _navigatorKeys = {
    TabItem.FORECAST: GlobalKey<NavigatorState>(),
    TabItem.LOCATIONS: GlobalKey<NavigatorState>(),
    TabItem.SETTINGS: GlobalKey<NavigatorState>(),
  };

  var _currentTab = TabItem.FORECAST;

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentTab != TabItem.FORECAST) {
          _selectTab(TabItem.FORECAST);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.FORECAST),
          _buildOffstageNavigator(TabItem.LOCATIONS),
          _buildOffstageNavigator(TabItem.SETTINGS),
        ]),
        bottomNavigationBar: MyBottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
        selectTabFunction: _selectTab,
      ),
    );
  }
}
