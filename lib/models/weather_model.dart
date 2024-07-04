/// The Weather class in Dart represents weather data for a specific city including temperature,
/// conditions, min and max temperature, humidity, and wind speed.
class Weather {
  final String cityName;
  final double temperature;
  final String condition;
  final double minTemp;
  final double maxTemp;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.minTemp,
    required this.maxTemp,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      condition: json['weather'][0]['description'],
      minTemp: json['main']['temp_min'].toDouble(),
      maxTemp: json['main']['temp_max'].toDouble(),
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }
}
