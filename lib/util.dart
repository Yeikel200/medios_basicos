import 'package:flutter/material.dart';

TextStyle primaryTextStyle() {
  return TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w800,
    fontSize: 16.0,
  );
}

TextStyle secondaryTextStyle() {
  return TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w300,
    fontSize: 16.0,
  );
}

LinearGradient get gradientGreemColor {
  return LinearGradient(colors: [
    Colors.green[400],
    Colors.green[300],
    Colors.green[200],
    Colors.green[100],
  ], begin: Alignment.bottomRight, end: Alignment.topLeft);
}

LinearGradient get gradientYellowColor {
  return LinearGradient(colors: [
    Colors.yellow[400],
    Colors.yellow[300],
    Colors.yellow[200],
    Colors.yellow[100],
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
}

LinearGradient get gradientBlueColor {
  return LinearGradient(colors: [
    Colors.blue[400],
    Colors.blue[300],
    Colors.blue[200],
    Colors.blue[100],
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
}