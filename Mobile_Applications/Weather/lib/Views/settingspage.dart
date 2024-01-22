import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  String _unit = 'Metric'; // Default value

  @override
  void initState() {
    super.initState();
    _loadUnitPreference();
  }

  _loadUnitPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _unit = prefs.getString('unit') ?? 'Metric';
    });
  }

  _saveUnitPreference(String unit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('unit', unit);
    setState(() {
      _unit = unit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue,
      ),
      body: ListTile(
        title: const Text('Temperature Unit'),
        trailing: DropdownButton<String>(
          value: _unit,
          items: <String>['Metric', 'Imperial']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              _saveUnitPreference(newValue);
            }
          },
        ),
      ),
    );
  }
}
