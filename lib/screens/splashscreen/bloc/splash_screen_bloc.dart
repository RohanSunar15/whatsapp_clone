import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:whatsapp_clone/screens/welcomescreen/welcome_screen.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitialState()) {
    on<NavigateToChatScreen>(navigateToChatScreen);
  }

  FutureOr<void> navigateToChatScreen(NavigateToChatScreen event, Emitter<SplashScreenState> emit) async{
    print('going to Welcome Screen');

    await Future.delayed(Duration(seconds: 1));
    emit(SplashScreenToWelcomeScreenState());
  }
}
