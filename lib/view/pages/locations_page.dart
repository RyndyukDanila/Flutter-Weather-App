import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/cities_controller.dart';
import 'package:flutter_weather_app/model/cities_preferences.dart';
import 'package:flutter_weather_app/view/pages/forecast_page.dart';
import 'package:flutter_weather_app/view/utils/tab_navigator.dart';
import 'package:provider/provider.dart';

import '../../controller/location_controller.dart';
import '../../model/tab.dart';
import '../screens/home_screen.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({super.key, required this.onTapCityFunction});
  final Function onTapCityFunction;

  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  final TextEditingController _textFieldController = TextEditingController();

  void _onTapCityFunction(TabItem tabItem) {
    widget.onTapCityFunction(tabItem);
  }

  Future<void> _displayDialog(CitiesController citiesNotifier) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new city'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new city'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                citiesNotifier.addCityItem(_textFieldController.text);
                _textFieldController.clear();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CitiesController>(
      create: (_) => CitiesController(),
      child: Consumer2<LocationController, CitiesController>(
        builder: (context, LocationController locationNotifier,
            CitiesController citiesNotifier, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Locations Page"),
              actions: [
                IconButton(
                  onPressed: () {
                    _displayDialog(citiesNotifier);
                  },
                  icon: Icon(Icons.add_rounded),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReorderableListView(
                children: <Widget>[
                  for (int index = 0;
                      index < citiesNotifier.cities.length;
                      index += 1)
                    ListTile(
                      key: Key('$index'),
                      title: Text(citiesNotifier.cities[index]),
                      leading: Icon(Icons.drag_handle_rounded),
                      trailing: IconButton(
                        icon: Icon(Icons.close_rounded),
                        onPressed: () => citiesNotifier
                            .handleCityDelete(citiesNotifier.cities[index]),
                      ),
                      onTap: () async {
                        locationNotifier.getLocation(
                            name: citiesNotifier.cities[index]);
                        citiesNotifier.selectCity(index);
                        _onTapCityFunction(TabItem.FORECAST);
                      },
                      selected: citiesNotifier.cities[index] ==
                          citiesNotifier.selectedCity,
                      selectedTileColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                ],
                onReorder: (int oldIndex, int newIndex) {
                  citiesNotifier.reorderCitites(oldIndex, newIndex);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
