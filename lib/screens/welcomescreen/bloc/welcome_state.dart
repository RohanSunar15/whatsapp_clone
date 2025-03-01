part of 'welcome_bloc.dart';

@immutable
sealed class WelcomeState {}

final class WelcomeInitial extends WelcomeState {}

abstract class WelcomeActionState extends WelcomeState{}

class ShowDropdownState extends WelcomeState{}

class SelectedLanguageState extends WelcomeActionState{}

class WelcomeToLanguageScreenState extends WelcomeState{}

class WelcomeToAuthenticationScreenState extends WelcomeState{}
