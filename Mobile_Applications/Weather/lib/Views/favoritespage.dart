import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mp5/models/favoritecitiesmodel.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  FavoritesPageState createState() => FavoritesPageState();
}

class FavoritesPageState extends State<FavoritesPage> {
  // Define _addCity and _removeCity as member methods of the class

  void _addCity(String city) {
    final favoriteCitiesModel =
        Provider.of<FavoriteCitiesModel>(context, listen: false);
    if (!favoriteCitiesModel.favoriteCities.contains(city) && city.isNotEmpty) {
      favoriteCitiesModel.addCity(city);
    }
  }

  void _removeCity(String city) {
    final favoriteCitiesModel =
        Provider.of<FavoriteCitiesModel>(context, listen: false);
    if (favoriteCitiesModel.favoriteCities.contains(city)) {
      favoriteCitiesModel.removeCity(city);
    }
  }

  void _addCityDialog() {
    String newCity = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a City'),
          content: TextField(
            onChanged: (value) {
              newCity = value;
            },
            decoration: const InputDecoration(hintText: "City Name"),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                _addCity(newCity.trim());
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final favoriteCitiesModel = Provider.of<FavoriteCitiesModel>(context);
    final favoriteCities = favoriteCitiesModel.favoriteCities;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Favorite Cities'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addCityDialog,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: favoriteCities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteCities[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _removeCity(favoriteCities[index]),
            ),
          );
        },
      ),
    );
  }
}
