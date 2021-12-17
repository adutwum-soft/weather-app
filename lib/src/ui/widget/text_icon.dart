import 'package:flutter/material.dart';

Widget TextIcon({required String text, required Icon icon}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(text),
      const SizedBox(
        width: 5,
      ),
      icon,
    ],
  );
}
