import 'package:flutter/material.dart';

import '../../constant/color.dart';
import 'language_screen/language_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Image.asset('assets/images/welcome_image.png', scale: 4),
            ),
            Text('Welcome to WhatsApp', style: TextStyle(fontSize: 25)),
            SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Read our ',
                  style: TextStyle(color: grey, fontSize: 13),
                  children: [
                    TextSpan(
                      text: 'Privacy Policy. ',
                      style: TextStyle(color: blue),
                    ),
                    TextSpan(
                      text: 'Tap "Agree and continue" to accept the ',
                      style: TextStyle(color: grey),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Terms of Service.',
                  style: TextStyle(color: blue, fontSize: 13),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: lightGrey,
                      overlayColor: grey
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      // Allows better height control
                      backgroundColor: Colors.transparent,
                      // Makes it blend with UI
                      builder: (context) => const LanguageScreen(),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.language, color: lightGreen, size: 25,),
                      SizedBox(width: 10,),
                      Text('English', style: TextStyle(
                        color: lightGreen,
                      ),),
                      SizedBox(width: 10,),
                      Icon(Icons.keyboard_arrow_down, color: lightGreen,
                        size: 25,),

                    ],
                  )),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: lightGreen,

              ),
                onPressed: () {},
                child: SizedBox(
                  width: double.maxFinite,
                  child: Center(
                    child: Text('Agree and continue' , style: TextStyle(
                      color: white,
                      fontSize: 13
                    ),),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
