import 'package:flutter/material.dart';

import '../../constant/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 180,),
            Image.asset(
                'assets/images/whatsapp_light_green_logo.png',
              color: lightGreen,
              scale: 25,
            ),
            SizedBox(height: 100,),
            Column(
              children: [
                Text(
                    'from',
                    style: TextStyle(
                  color: Colors.grey
                )),
                Image.asset(
                  'assets/images/meta_logo_text.png',
                  scale : 7,
                  color: lightGreen,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
