import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({String? desc, Color? color, double? size}) {
  switch (desc) {
    case 'Clear':
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }
    case 'Clouds':
      {
        return Icon(
          FontAwesomeIcons.cloud,
          color: color,
          size: size,
        );
      }
    case 'Rain':
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: color,
          size: size,
        );
      }
    case 'Snow':
      {
        return Icon(
          FontAwesomeIcons.snowman,
          color: color,
          size: size,
        );
      }
    default:
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }
  }
}
