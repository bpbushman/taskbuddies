import 'package:flutter/material.dart';
//import 'package:taskbuddies/ui/widgets/helpers.dart';

Widget listHeader(String title, String subtitle) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.grey[700],
          ),
        ),
      ),
    ],
  );
}

Widget listIndicator(double value) {
  return LinearProgressIndicator(
    minHeight: 6.0,
    value: value,
    backgroundColor: Colors.grey,
    valueColor: (value == 1)
        ? AlwaysStoppedAnimation(Colors.green)
        : AlwaysStoppedAnimation(Colors.orangeAccent),
  );
}
