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
