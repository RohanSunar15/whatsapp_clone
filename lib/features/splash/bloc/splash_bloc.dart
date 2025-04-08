import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitialState()) {
    on<NavigateToChatScreenEvent>(navigateToChatScreen);
  }

  FutureOr<void> navigateToChatScreen(NavigateToChatScreenEvent event, Emitter<SplashScreenState> emit) async{
    print('going to Welcome Screen');

    await Future.delayed(Duration(seconds: 1));

    emit(SplashScreenToWelcomeScreenState());
  }
}
