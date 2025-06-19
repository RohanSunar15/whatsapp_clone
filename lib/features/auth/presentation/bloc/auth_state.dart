part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class FormBothFieldsEmpty extends AuthState {}

final class FormPhoneMissing extends AuthState {}

final class PhoneNumberUnderLimit extends AuthState{}

final class PhoneNumberExceedsLimit extends AuthState{}

final class PhoneNumberFormatted extends AuthState{
  final String formattedPhoneNumber;

  PhoneNumberFormatted({required this.formattedPhoneNumber});
}

//Loading
final class PhoneAuthLoading extends AuthState {}

//
final class AuthFormValidation extends AuthState {
  final String phoneWithCountryCode ;

  AuthFormValidation({required this.phoneWithCountryCode ,});
}

/// Triggered when user selects a country
final class AuthCountrySelected extends AuthState{
  final String countryName;
  final String countryCode;

  AuthCountrySelected({required this.countryName, required this.countryCode});
}

/// Triggered when an invalid country code is selected
final class CountryCodeInvalid extends AuthState{
  final String countryCode;

  CountryCodeInvalid({required this.countryCode});
}



//OTP VERIFICATION SCREEN
final class OtpUpdated extends AuthState{
  final String otp;
  final int cursorPosition;

  OtpUpdated({required this.otp, required this.cursorPosition});

}

final class BackToAuthScreen extends AuthState {}

final class NavigateToOtpVerificationScreen extends AuthState {
  final String phoneWithCountryCode;

  NavigateToOtpVerificationScreen({required this.phoneWithCountryCode});
}

final class OtpSendingLoading extends AuthState {}


class OtpSentState extends AuthState {
  final String verificationId;

  OtpSentState(this.verificationId);
}



final class OtpVerificationFailure extends AuthState{}

final class OtpVerifying extends AuthState{}

final class Authenticated extends AuthState{}

final class AuthSuccess extends AuthState{}

/// Triggered when there is an error in auth flow
final class AuthFailure extends AuthState {
final String message;

AuthFailure({required this.message});

}