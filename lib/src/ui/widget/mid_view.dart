import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/src/model/weather_forcast.dart';
import 'package:weather/src/res/styles.dart';
import 'package:weather/src/ui/widget/element.dart';
import 'package:weather/src/utils/util.dart';
import 'package:weather/src/utils/weather_conveter.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForcast> snapshot;
  const MidView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = snapshot.data!;
    var forcastList = data.list;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${data.city.name}, ${data.city.country}',
              style: AppStyles.style18,
            ),
            Text(
              '${Util.getFormattedDate(DateTime.fromMillisecondsSinceEpoch(data.list[0].dt * 1000))}',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(
                desc: forcastList[0].weather[0].main,
                color: Colors.pinkAccent,
                size: 198,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${forcastList[0].temp.day.toStringAsFixed(0)}˚F',
                    style: const TextStyle(
                      fontSize: 34,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(forcastList[0].weather[0].description.toUpperCase()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Elements(
                    title: '${forcastList[0].speed.toStringAsFixed(1)} mi/h',
                    icon: const Icon(
                      FontAwesomeIcons.temperatureHigh,
                      size: 20,
                      color: Colors.brown,
                    ),
                  ),
                  Elements(
                    title: '${forcastList[0].humidity.toStringAsFixed(0)} %',
                    icon: const Icon(
                      FontAwesomeIcons.solidGrinBeamSweat,
                      size: 20,
                      color: Colors.brown,
                    ),
                  ),
                  Elements(
                    title: '${forcastList[0].temp.max.toStringAsFixed(0)} ˚F',
                    icon: const Icon(
                      FontAwesomeIcons.wind,
                      size: 20,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
