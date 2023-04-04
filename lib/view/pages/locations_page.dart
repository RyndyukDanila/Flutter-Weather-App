import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/cities_controller.dart';
import 'package:provider/provider.dart';

import '../../controller/forecast_controller.dart';
import '../../model/tab.dart';

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
      child: Consumer2<ForecastController, CitiesController>(
        builder: (context, ForecastController forecastNotifier, CitiesController citiesNotifier, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Locations Page"),
              actions: [
                IconButton(
                  onPressed: () {
                    _displayDialog(citiesNotifier);
                  },
                  icon: const Icon(Icons.add_rounded),
                )
              ],
            ),
            body: ReorderableListView(
              header: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Material(
                  elevation: 3,
                  child: ListTile(
                    title: Text('Get your current location'),
                    leading: const Icon(Icons.my_location_rounded),
                    onTap: () {
                      forecastNotifier.getCurrentLocation();
                      citiesNotifier.selectedCity = null;
                      _onTapCityFunction(TabItem.FORECAST);
                    },
                  ),
                ),
              ),
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              children: <Widget>[
                for (int index = 0; index < citiesNotifier.cities.length; index += 1)
                  Padding(
                    key: Key('$index'),
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Material(
                      elevation: 3,
                      child: ListTile(
                        title: Text(citiesNotifier.cities[index]),
                        leading: const Icon(Icons.drag_handle_rounded),
                        trailing: IconButton(
                          icon: const Icon(Icons.close_rounded),
                          onPressed: () => citiesNotifier.handleCityDelete(citiesNotifier.cities[index]),
                        ),
                        onTap: () async {
                          forecastNotifier.getLocation(name: citiesNotifier.cities[index]);
                          citiesNotifier.selectCity(index);
                          _onTapCityFunction(TabItem.FORECAST);
                        },
                        selected: citiesNotifier.cities[index] == citiesNotifier.selectedCity,
                        selectedColor: Theme.of(context).indicatorColor,
                      ),
                    ),
                  ),
              ],
              onReorder: (int oldIndex, int newIndex) {
                citiesNotifier.reorderCitites(oldIndex, newIndex);
              },
            ),
          );
        },
      ),
    );
  }
}
