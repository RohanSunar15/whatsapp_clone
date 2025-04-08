import 'package:flutter/material.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

abstract class OnboardingActionState extends OnboardingState{}

class ShowDropdownState extends OnboardingState{}

class SelectedLanguageState extends OnboardingActionState{}

class WelcomeToLanguageScreenState extends OnboardingState{}

class WelcomeToAuthenticationScreenState extends OnboardingState{}
