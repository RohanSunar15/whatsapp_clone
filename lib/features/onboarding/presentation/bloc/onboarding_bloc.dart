import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:whatsapp_clone/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:whatsapp_clone/features/onboarding/presentation/bloc/onboarding_state.dart';


class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<ActionButtonClickedEvent>(actionButtonClickedEvent);


    on<LanguageButtonClickedEvent>(languageButtonClickedEvent);
    on<AgreeAndContinueButtonClickedEvent>(agreeAndContinueButtonClickedEvent);
  }

  FutureOr<void> actionButtonClickedEvent(ActionButtonClickedEvent event,
      Emitter<OnboardingState> emit) {
    print('clicked2');
    emit(ShowDropdownState());
  }

  FutureOr<void> languageButtonClickedEvent(LanguageButtonClickedEvent event, Emitter<OnboardingState> emit) {
    emit(WelcomeToLanguageScreenState());
  }

  FutureOr<void> agreeAndContinueButtonNavigateToAuthenticationScreen(AgreeAndContinueButtonClickedEvent event, Emitter<OnboardingState> emit) {
    emit(WelcomeToAuthenticationScreenState());
  }

  FutureOr<void> agreeAndContinueButtonClickedEvent(AgreeAndContinueButtonClickedEvent event, Emitter<OnboardingState> emit) {
    emit(WelcomeToAuthenticationScreenState());
  }
}
