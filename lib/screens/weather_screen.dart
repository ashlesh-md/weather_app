import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

/// The `WeatherScreen` class in Dart is a StatelessWidget that displays weather information using a
/// Consumer widget and custom styling based on weather conditions.
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  String capitalize(String s) =>
      s.isNotEmpty ? '${s[0].toUpperCase()}${s.substring(1)}' : s;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
        ),
        body: Consumer<WeatherProvider>(
          builder: (context, provider, child) {
            if (provider.loading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            } else if (provider.errorMessage != null) {
              return Center(
                child: Text(
                  provider.errorMessage!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else if (provider.weather != null) {
              final weather = provider.weather!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        capitalize(weather.cityName),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _getWeatherIcon(weather.condition),
                          const SizedBox(width: 10),
                          Text(
                            '${weather.temperature}°C',
                            style: const TextStyle(fontSize: 48),
                          ),
                        ],
                      ),
                      Text(
                        capitalize(weather.condition),
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.indigo,
                        child: ListTile(
                          leading:
                              const Icon(Icons.thermostat, color: Colors.white),
                          title: const Text(
                            'Min Temperature',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            '${weather.minTemp}°C',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.indigo,
                        child: ListTile(
                          leading:
                              const Icon(Icons.thermostat, color: Colors.white),
                          title: const Text(
                            'Max Temperature',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            '${weather.maxTemp}°C',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.indigo,
                        child: ListTile(
                          leading:
                              const Icon(Icons.water_drop, color: Colors.white),
                          title: const Text(
                            'Humidity',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            '${weather.humidity}%',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.indigo,
                        child: ListTile(
                          leading: const Icon(Icons.air, color: Colors.white),
                          title: const Text(
                            'Wind Speed',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            '${weather.windSpeed} m/s',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text('No weather data'));
            }
          },
        ),
      ),
    );
  }

  Icon _getWeatherIcon(String condition) {
    String lowerCaseCondition = condition.toLowerCase();

    if (lowerCaseCondition.contains('sunny') ||
        lowerCaseCondition.contains('clear')) {
      return const Icon(Icons.wb_sunny, color: Colors.yellow, size: 50);
    } else if (lowerCaseCondition.contains('cloudy')) {
      return const Icon(Icons.cloud, color: Colors.grey, size: 50);
    } else if (lowerCaseCondition.contains('rainy') ||
        lowerCaseCondition.contains('rain')) {
      return const Icon(Icons.grain, color: Colors.blue, size: 50);
    } else if (lowerCaseCondition.contains('snowy') ||
        lowerCaseCondition.contains('snow')) {
      return const Icon(Icons.ac_unit, color: Colors.lightBlue, size: 50);
    } else if (lowerCaseCondition.contains('thunderstorm') ||
        lowerCaseCondition.contains('thunder')) {
      return const Icon(Icons.flash_on, color: Colors.orange, size: 50);
    } else {
      return const Icon(Icons.wb_cloudy, color: Colors.blueGrey, size: 50);
    }
  }
}
