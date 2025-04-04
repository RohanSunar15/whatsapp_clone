import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_theme.dart';
import 'package:whatsapp_clone/features/auth/auth.dart';
import 'package:whatsapp_clone/features/auth/countryCodePage/country_code_page.dart';
import 'package:whatsapp_clone/features/splashscreen/splash_screen.dart';
import 'package:whatsapp_clone/features/welcomescreen/welcome_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,

      home: SplashScreen(),
    );
  }
}
