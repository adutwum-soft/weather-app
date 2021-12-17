import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/src/model/weather_forcast.dart';
import 'package:weather/src/ui/widget/text_icon.dart';
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
            radius: 25,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
              desc: forcastList[index].weather[0].main,
              color: Colors.pinkAccent,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextIcon(
                  text: '${forcastList[index].temp.max.toString()} ˚F',
                  icon: const Icon(
                    FontAwesomeIcons.solidArrowAltCircleUp,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
                TextIcon(
                  text: '${forcastList[index].temp.min.toString()} ˚F',
                  icon: const Icon(
                    FontAwesomeIcons.solidArrowAltCircleDown,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
                TextIcon(
                  text: '${forcastList[0].humidity}',
                  icon: const Icon(
                    FontAwesomeIcons.solidGrinBeamSweat,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
                TextIcon(
                  text: '${forcastList[0].speed}',
                  icon: const Icon(
                    FontAwesomeIcons.wind,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    ],
  );
}
