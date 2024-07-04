# Flutter Weather App

A Flutter application that allows users to check weather conditions for different cities. Users can search for weather by city name and view detailed weather information.

## Features

1. **LocationScreen**

   - Search for weather by city name.
   - Display recent searches.
   - Handles Api calls on multiple clicks of same buttons
   - Error handling for failed searches.

2. **WeatherScreen**

   - Display detailed weather information including temperature, conditions, min/max temperatures, humidity, and wind speed.
   - Loading spinner while fetching data.
   - Error handling for failed data fetches.

3. **WeatherProvider**

   - Manages state for weather data using Provider.
   - Fetches weather data from OpenWeatherMap API.
   - Handles loading and error states.
   - Stores recent search history.

4. **WeatherService**
   - Makes HTTP requests to OpenWeatherMap API.
   - Parses JSON responses.
   - Handles exceptions for failed API requests.

## Installation

1. Clone the repository:

   ```bash
   git clone <repository-url>
   ```

2. ```bash
   flutter pub get
   ```
3. ```bash
   flutter run
   ```

## ScreenShots
![Screenshot_1720107391](https://github.com/ashlesh-md/weather_app/assets/113172856/096d4fd8-0555-4b4e-b362-9e99b6272145)
![Screenshot_1720107407](https://github.com/ashlesh-md/weather_app/assets/113172856/f9b982ce-6755-48e4-979c-fc9662584e82)
![Screenshot_1720107421](https://github.com/ashlesh-md/weather_app/assets/113172856/7e74f8c2-d7c4-43e4-b542-239943319f4c)
![Screenshot_1720107431](https://github.com/ashlesh-md/weather_app/assets/113172856/09616659-dd09-4194-ad40-aaf891e185ad)
![Screenshot_1720107447](https://github.com/ashlesh-md/weather_app/assets/113172856/5c0ddf6f-1a3a-4261-ab4d-163624bdb897)
![Screenshot_1720107460](https://github.com/ashlesh-md/weather_app/assets/113172856/d62901c1-3f5b-4b3b-8b3a-f5131ec02075)
![Screenshot_1720107474](https://github.com/ashlesh-md/weather_app/assets/113172856/c782ddec-8f3f-4de8-8dea-a0e1385added)

