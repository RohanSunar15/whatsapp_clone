import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial()) {
    on<ActionButtonClickedEvent>(actionButtonClickedEvent);


    on<LanguageButtonClickedEvent>(languageButtonClickedEvent);
    on<AgreeAndContinueButtonClickedEvent>(agreeAndContinueButtonClickedEvent);
  }

  FutureOr<void> actionButtonClickedEvent(ActionButtonClickedEvent event,
      Emitter<WelcomeState> emit) {
    print('clicked2');
    emit(ShowDropdownState());
  }

  FutureOr<void> languageButtonClickedEvent(LanguageButtonClickedEvent event, Emitter<WelcomeState> emit) {
    emit(WelcomeToLanguageScreenState());
  }

  FutureOr<void> agreeAndContinueButtonNavigateToAuthenticationScreen(AgreeAndContinueButtonClickedEvent event, Emitter<WelcomeState> emit) {
    emit(WelcomeToAuthenticationScreenState());
  }

  FutureOr<void> agreeAndContinueButtonClickedEvent(AgreeAndContinueButtonClickedEvent event, Emitter<WelcomeState> emit) {
    emit(WelcomeToAuthenticationScreenState());
  }
}
