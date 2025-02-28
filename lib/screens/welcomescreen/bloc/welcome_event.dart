part of 'welcome_bloc.dart';

@immutable
sealed class WelcomeEvent {}

class PrivacyPolicyClickedEvent extends WelcomeEvent{}

class TermsOfServiceClickedEvent extends WelcomeEvent{}

class LanguageButtonClickedEvent extends WelcomeEvent{}

class AgreeAndContinueButtonClickedEvent extends WelcomeEvent{}

class LanguageButtonNavigateToLanguageScreen extends WelcomeEvent{}

class AgreeAndContinueButtonNavigateToChatScreen extends WelcomeEvent{}