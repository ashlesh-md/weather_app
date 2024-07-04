import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

/// The `WeatherProvider` class manages weather data retrieval, loading state, error handling, and
/// recent searches in a Flutter application.
class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _loading = false;
  String? _errorMessage;
  List<String> _recentSearches = [];

  Weather? get weather => _weather;
  bool get loading => _loading;
  String? get errorMessage => _errorMessage;
  List<String> get recentSearches => _recentSearches;

  Future<void> fetchWeather(String cityName) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _weather = await WeatherService().fetchWeather(cityName);
      addToRecentSearches(cityName);
    } catch (e) {
      _errorMessage = 'Failed to fetch weather data: $e';
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void addToRecentSearches(String cityName) {
    if (!_recentSearches.contains(cityName)) {
      _recentSearches.add(cityName);
      if (_recentSearches.length > 5) {
        _recentSearches.removeAt(0);
      }
      notifyListeners();
    }
  }
}
