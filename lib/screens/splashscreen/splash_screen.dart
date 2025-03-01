import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/screens/splashscreen/bloc/splash_screen_bloc.dart';
import 'package:whatsapp_clone/screens/welcomescreen/welcome_screen.dart';

import '../../constant/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenBloc splashScreenBloc = SplashScreenBloc();

  @override
  void initState() {
    splashScreenBloc.add(NavigateToChatScreenEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocListener<SplashScreenBloc, SplashScreenState>(
        bloc: splashScreenBloc,
        listener: (context, state) {
          if (state is SplashScreenToWelcomeScreenState) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => WelcomeScreen()));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 180),
              Image.asset(
                'assets/images/whatsapp_light_green_logo.png',
                color: lightGreen,
                scale: 25,
              ),
              SizedBox(height: 100),
              Column(
                children: [
                  Text('from', style: TextStyle(color: Colors.grey)),
                  Image.asset(
                    'assets/images/meta_logo_text.png',
                    scale: 7,
                    color: lightGreen,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
