import 'package:flutter/material.dart';

import '../model/tab.dart';

const Map<TabItem, MyTab> tabs = {
  TabItem.FORECAST: MyTab(name: "Forecast", icon: Icons.bar_chart_rounded),
  TabItem.LOCATIONS: MyTab(name: "Locations", icon: Icons.location_on),
  TabItem.SETTINGS: MyTab(name: "Settings", icon: Icons.settings_rounded)
};

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation(
      {super.key, required this.currentTab, required this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedFontSize: 12,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentTab.index,
        items: [
          _buildItem(TabItem.FORECAST),
          _buildItem(TabItem.LOCATIONS),
          _buildItem(TabItem.SETTINGS),
        ],
        onTap: (index) => onSelectTab(TabItem.values[index]));
  }

  BottomNavigationBarItem _buildItem(TabItem item) {
    return BottomNavigationBarItem(
      icon: Icon(tabs[item]!.icon),
      label: tabs[item]!.name,
    );
  }
}
