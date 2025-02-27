import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constant/color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        surface: white,
    ),
    scaffoldBackgroundColor: white,

);

ThemeData darkTheme = ThemeData(
  brightness:  Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: darkGreen,
  )
);