part of 'welcome_bloc.dart';

@immutable
sealed class WelcomeState {}

final class WelcomeInitial extends WelcomeState {}

abstract class WelcomeActionState extends WelcomeState{}

class SelectedLanguageState extends WelcomeActionState{}

class WelcomeScreenToChatScreen extends WelcomeState{}
