import 'package:flutter/material.dart';

Widget normalText({text, color = Colors.white, size = 12.0}) {
  return Text(
    '$text',
    style: TextStyle(color: color, fontSize: size),
  );
}

Widget boldText({text, color = Colors.white, size = 16.0}) {
  return Text(
    '$text',
    style: TextStyle(color: color, fontSize: size, fontWeight: FontWeight.w600),
  );
}
