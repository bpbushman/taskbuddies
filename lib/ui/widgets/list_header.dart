import 'package:flutter/material.dart';
import 'package:taskbuddies/ui/widgets/helpers.dart';

Widget listHeader(String title, String subtitle) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      smallVertSpace(),
      Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      Text(
        subtitle,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    ],
  );
}

Widget listIndicator(double value) {
  return LinearProgressIndicator(
    value: value,
    backgroundColor: Colors.grey,
    valueColor: (value == 1)
        ? AlwaysStoppedAnimation(Colors.green)
        : AlwaysStoppedAnimation(Colors.orangeAccent),
  );
}
