import 'package:flutter/material.dart';

class Elements extends StatelessWidget {
  final String title;
  final Icon icon;
  const Elements({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title),
          icon,
        ],
      ),
    );
  }
}
