part of 'splash_bloc.dart';

@immutable
sealed class SplashScreenState {}

final class SplashScreenInitialState extends SplashScreenState {}

class SplashScreenLoadingState extends SplashScreenState {}

class SplashScreenLoadedState extends SplashScreenState {}

class SplashScreenToWelcomeScreenState extends SplashScreenState {}