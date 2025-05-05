part of 'auth_bloc.dart';

@immutable
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


final class FormError extends AuthState {
}

/// Triggered when OTP is verified successfully
final class PhoneAuthSuccess extends AuthState {}

/// Triggered when OTP is successfully sent
final class OtpSendSuccess extends AuthState {}

/// Triggered when there is an error in auth flow
final class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});

}

/// Triggered when user selects a country
final class AuthCountrySelected extends AuthState{
  final String countryName;
  final String countryCode;

  AuthCountrySelected({required this.countryName, required this.countryCode});
}

/// Triggered when an invalid country code is selected
///
final class CountryCodeInvalid extends AuthState{
  final String countryCode;

  CountryCodeInvalid({required this.countryCode});
}

