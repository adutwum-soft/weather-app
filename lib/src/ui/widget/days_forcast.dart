import 'package:flutter/material.dart';
import 'package:weather/src/model/weather_forcast.dart';
import 'package:weather/src/res/strings.dart';
import 'package:weather/src/res/styles.dart';

import 'forcast_card.dart';

Widget dayForcast(
    AsyncSnapshot<WeatherForcast> snapshot, BuildContext context) {
  var forcastList = snapshot.data!.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text(
        Strings.day_desc,
        style: AppStyles.style14,
      ),
      Container(
        height: 170,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 16,
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(
            width: 8,
          ),
          itemCount: forcastList.length,
          itemBuilder: (context, i) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 160,
                child: forcastCard(snapshot, i),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF9661C3), Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
