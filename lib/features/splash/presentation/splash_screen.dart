import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/onboarding/presentation/onboarding.dart';
import 'package:whatsapp_clone/features/splash/presentation//bloc/splash_bloc.dart';

import '../../../core/theme/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenBloc splashScreenBloc = SplashScreenBloc();

  @override
  void initState() {
    super.initState();
    splashScreenBloc.add(NavigateToChatScreenEvent());

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
            ).push(MaterialPageRoute(builder: (context) => Onboarding()));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 180),
              Image.asset(
                'assets/images/whatsapp_light_green_logo.png',
                color: AppColor.lightGreen,
                scale: 25,
              ),
              SizedBox(height: 100),
              Column(
                children: [
                  Text('from', style: TextStyle(color: Colors.grey)),
                  Image.asset(
                    'assets/images/meta_logo_text.png',
                    scale: 7,
                    color: AppColor.lightGreen,
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
