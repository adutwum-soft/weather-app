import 'package:flutter/material.dart';
import 'package:weather/src/model/weather_forcast.dart';
import 'package:weather/src/utils/util.dart';
import 'package:weather/src/utils/weather_conveter.dart';

Widget forcastCard(AsyncSnapshot<WeatherForcast> snapshot, int index) {
  var forcastList = snapshot.data!.list;
  var dayOfWeek = '';
  var fullDate = Util.getFormattedDate(
      DateTime.fromMillisecondsSinceEpoch(forcastList[index].dt * 1000));
  dayOfWeek = fullDate.split(',')[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dayOfWeek),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
              desc: forcastList[index].weather[0].main,
              color: Colors.pinkAccent,
              size: 35,
            ),
          ),
        ],
      )
    ],
  );
}
