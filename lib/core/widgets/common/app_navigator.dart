import 'package:flutter/material.dart';

class AppNavigator {
  static void pushToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static void pushReplacementScreen(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static void popScreen(BuildContext context) {
    Navigator.pop(context);
  }
}
