import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather/src/model/weather_forcast.dart';
import 'package:weather/src/utils/constants.dart';

class Network {
  Future<WeatherForcast> getWeatherForcast({required String cityName}) async {
    var finalUrl =
        'https://api.openweathermap.org/data/2.5/forecast/daily?q=$cityName&appid=${Constants.appId}&units=imperial';
    final response = await get(Uri.parse(finalUrl));

    if (response.statusCode == 200) {
      return WeatherForcast.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error geting Data");
    }
  }
}
