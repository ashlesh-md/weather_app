import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

/// The WeatherService class fetches weather data for a given city using an API key and URL.
class WeatherService {
  static const String apiKey = '9d3fd511637028c667538aec847749eb';
  static const String apiUrl = 'http://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$apiUrl?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      log(json.toString());
      return Weather.fromJson(json);
    } else {
      log(json.toString());
      throw Exception('Failed to load weather');
    }
  }
}
