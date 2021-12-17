import 'package:flutter/material.dart';
import 'package:weather/src/model/weather_forcast.dart';
import 'package:weather/src/network/network.dart';
import 'package:weather/src/ui/widget/days_forcast.dart';
import 'package:weather/src/ui/widget/mid_view.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  late Future<WeatherForcast> forecast;
  String _cityName = 'san diego';

  @override
  void initState() {
    super.initState();
    forecast = getWeather(_cityName);
    // forecast.then((weather) => {print(weather.city.country)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForcast>(
              future: forecast,
              builder: (context, AsyncSnapshot<WeatherForcast> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      midView(snapshot),
                      dayForcast(snapshot, context),
                    ],
                  );
                } else {
                  return Container(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<WeatherForcast> getWeather(String city) {
    return Network().getWeatherForcast(cityName: city);
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter City Name',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.all(8),
          ),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecast = getWeather(_cityName);
            });
          }),
    );
  }
}
