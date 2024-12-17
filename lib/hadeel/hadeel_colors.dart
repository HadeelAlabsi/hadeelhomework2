import 'package:flutter/material.dart';

class HadeelColors {
  static const Color primaryOrange = Color(0xFFFF8C00);
  static const Color secondaryOrange = Color(0xFFFFA500);
  static const Color lightOrange = Color(0xFFFFD700);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;

  static const LinearGradient orangeGradient = LinearGradient(
    colors: [primaryOrange, secondaryOrange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
