import 'package:flutter/material.dart';
import 'package:flutter_weather_app/view/pages/forecast_page.dart';
import 'package:flutter_weather_app/view/utils/tab_navigator.dart';

import '../../model/city.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({super.key});

  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<City> _cities = <City>[];

  void _addCityItem(String name) {
    setState(() {
      _cities.add(City(name: name));
    });
    _textFieldController.clear();
  }

  void _handleCityDelete(City city) {
    setState(() {
      _cities.remove(city);
    });
  }

  Future<void> _displayDialog() async {
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
                _addCityItem(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Locations Page"),
        actions: [
          IconButton(
            onPressed: () {
              _displayDialog();
            },
            icon: Icon(Icons.add_rounded),
          )
        ],
      ),
      body: ReorderableListView(
        children: <Widget>[
          for (int index = 0; index < _cities.length; index += 1)
            ListTile(
              key: Key('$index'),
              title: Text('${_cities[index]}'),
              leading: Icon(Icons.drag_handle_rounded),
              trailing: IconButton(
                icon: Icon(Icons.close_rounded),
                onPressed: () => _handleCityDelete(_cities[index]),
              ),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final City item = _cities.removeAt(oldIndex);
            _cities.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
