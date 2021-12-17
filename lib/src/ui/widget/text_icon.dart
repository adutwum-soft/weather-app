import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final String text;
  final Icon icon;
  const TextIcon({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
