import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import 'weather_screen.dart';

/// The LocationScreen class in Dart represents a screen for a weather app that allows users to search
/// for weather information by city name and displays recent searches.
class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isFetching = false;

  String capitalize(String s) =>
      s.isNotEmpty ? '${s[0].toUpperCase()}${s.substring(1)}' : s;

  void _fetchWeather(String cityName) {
    if (!_isFetching && cityName.isNotEmpty) {
      setState(() {
        _isFetching = true;
      });

      Provider.of<WeatherProvider>(context, listen: false)
          .fetchWeather(cityName)
          .then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WeatherScreen()),
        ).then((_) {
          setState(() {
            _isFetching = false;
          });
        });
      }).catchError((error) {
        setState(() {
          _isFetching = false;
        });
      });
    }
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Weather App',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onSubmitted: _fetchWeather,
              ),
              const SizedBox(height: 20),
              const Text(
                'Recent search',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Consumer<WeatherProvider>(
                  builder: (context, provider, child) {
                    if (provider.recentSearches.isEmpty) {
                      return const Center(
                        child: Text(
                          'No recent searches',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: provider.recentSearches.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 3, // Add shadow/elevation for 3D effect
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            color: Colors.indigo, // Background color
                            child: ListTile(
                              title: Text(
                                capitalize(provider.recentSearches[index]),
                                style: const TextStyle(
                                    color: Colors.white), // Text color
                              ),
                              onTap: () =>
                                  _fetchWeather(provider.recentSearches[index]),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
