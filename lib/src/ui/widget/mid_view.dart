import 'package:flutter/material.dart';
import 'package:weather/src/model/weather_forcast.dart';
import 'package:weather/src/res/styles.dart';

Widget midView(AsyncSnapshot<WeatherForcast> snapshot) {
  var data = snapshot.data!;
  var forecastList = data.list;
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '${data.city.name}, ${data.city.country}',
            style: AppStyles.style18,
          ),
        ],
      ),
    ),
  );

  return midView;
}
