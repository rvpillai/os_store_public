import 'package:flutter/material.dart';
import 'package:os_store/config/theme/app_colors.dart';

BoxDecoration containerBGDecoration = const BoxDecoration(
  // Box decoration takes a gradient
  gradient: LinearGradient(
    // Where the linear gradient begins and ends
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    // Add one stop for each color. Stops should increase from 0 to 1
    stops: [0.1, 0.4, 0.7, 1.0],
    colors: [
      // Colors are easy thanks to Flutter's Colors class.
      Color(0xff0D37C1),
      Colors.deepPurpleAccent,
      Colors.deepPurple,
      Colors.purple,
    ],
  ),
);

BoxDecoration btnDecorationViolet = BoxDecoration(
    gradient: LinearGradient(
        colors: [AppColors.BLUE, AppColors.VIOLET],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(3),
      bottomLeft: Radius.circular(3),
      bottomRight: Radius.circular(15),
    ));
