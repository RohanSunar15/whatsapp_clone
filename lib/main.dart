import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constant/theme.dart';
import 'package:whatsapp_clone/screens/chatscreen/chat_screen.dart';
import 'package:whatsapp_clone/screens/splashscreen/splash_screen.dart';
import 'package:whatsapp_clone/screens/welcomescreen/app_language_widget.dart';
import 'package:whatsapp_clone/screens/welcomescreen/welcome_screen.dart';

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

      home: AppLanguageWidget(),
    );
  }
}
