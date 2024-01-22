import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  final String apiKey = '88ff989b4a2616f89bec3a0500272218';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getCityWeather(String city) async {
    final response =
        await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
