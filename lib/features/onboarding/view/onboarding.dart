import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_popup_menu.dart';
import 'package:whatsapp_clone/features/auth/view/auth.dart';
import 'package:whatsapp_clone/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:whatsapp_clone/features/onboarding/bloc/onboarding_event.dart';
import 'package:whatsapp_clone/features/onboarding/bloc/onboarding_state.dart';

import '../../../core/theme/app_color.dart';
import '../language/view/language_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});


  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  OnboardingBloc onboardingBloc = OnboardingBloc();


  @override
  void initState() {
    onboardingBloc.add(ActionButtonClickedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.more_vert_outlined),
        ),
      ],
    ),
      body: BlocListener<OnboardingBloc, OnboardingState>(
        bloc: onboardingBloc,
        listener: (context, state) {
          if (state is ShowDropdownState) {
            print("showdropstate");
          } else if (state is WelcomeToLanguageScreenState) {
           _showLanguageBottomSheet(context);
          } else if (state is  WelcomeToAuthenticationScreenState) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AuthPage()));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
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
                    style: TextStyle(color: AppColor.grey, fontSize: 13),
                    children: [
                      TextSpan(
                        text: 'Privacy Policy. ',
                        style: TextStyle(color: AppColor.blue),
                      ),
                      TextSpan(
                        text: 'Tap "Agree and continue" to accept the ',
                        style: TextStyle(color: AppColor.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Terms of Service.',
                    style: TextStyle(color: AppColor.blue, fontSize: 13),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.lightGrey,
                        overlayColor: AppColor.grey
                    ),
                    onPressed: () {
                      onboardingBloc.add(LanguageButtonClickedEvent());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.language, color: AppColor.lightGreen, size: 25,),
                        SizedBox(width: 10,),
                        Text('English', style: TextStyle(
                          color: AppColor.lightGreen,
                        ),),
                        SizedBox(width: 10,),
                        Icon(Icons.keyboard_arrow_down, color: AppColor.lightGreen,
                          size: 25,),

                      ],
                    )),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.lightGreen,

                ),
                onPressed: () {
                  onboardingBloc.add(AgreeAndContinueButtonClickedEvent());
                },
                child: SizedBox(
                  width: double.maxFinite,
                  child: Center(
                    child: Text('Agree and continue', style: TextStyle(
                        color: AppColor.white,
                        fontSize: 13
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future _showLanguageBottomSheet(context){
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const LanguageScreen(),
  );
}




Widget _showPopupMenuWidget() {
  List<String> items = ["Help"];

  return Center(
    child: CustomPopupMenu(
      items: items,
      onSelected: (String value) {
        print(value);
      },
    ),
  );
}