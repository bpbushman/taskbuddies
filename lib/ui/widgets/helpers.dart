import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';

Widget smallVertSpace() => SizedBox(height: 8);
Widget mediumVertSpace() => SizedBox(height: 16);
Widget largeVertSpace() => SizedBox(height: 32);

Widget smallHorizontalSpace() => SizedBox(width: 8);
Widget mediumHorizontalSpace() => SizedBox(width: 16);
Widget largeHorizontalSpace() => SizedBox(width: 32);

PixelBorder pixelBorderProps() {
  return PixelBorder(
      borderRadius: BorderRadius.circular(20),
      pixelSize: 5,
      borderColor: Colors.black);
}
