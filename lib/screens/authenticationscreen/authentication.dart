import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constant/color.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              'Enter your phone number',
              style: TextStyle(
                color: black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                    'WhatsApp will need to verify your phone number. Carrier charges \nmay apply. ',
                style: TextStyle(
                  color: grey,
                  fontSize: 12,
                  decoration: TextDecoration.none,
                ),
                children: [

                  TextSpan(text: 'What\'s my number?',

                    style: TextStyle(

                      color: blue,
                      fontSize: 12,
                      decoration: TextDecoration.none,
                    ),

                  ),
                ]
              ),
            ),

          ],
        ),
      ),
    );
  }
}
