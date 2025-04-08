import 'package:flutter/material.dart';

@immutable
sealed class OnboardingEvent {}


class ActionButtonClickedEvent extends OnboardingEvent{}

class PrivacyPolicyClickedEvent extends OnboardingEvent{}

class TermsOfServiceClickedEvent extends OnboardingEvent{}

class LanguageButtonClickedEvent extends OnboardingEvent{}

class AgreeAndContinueButtonClickedEvent extends OnboardingEvent{}


