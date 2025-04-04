import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        surface: AppColor.white,
    ),
    scaffoldBackgroundColor: AppColor.white,

);

ThemeData darkTheme = ThemeData(
  brightness:  Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: AppColor.darkGreen,
  )
);