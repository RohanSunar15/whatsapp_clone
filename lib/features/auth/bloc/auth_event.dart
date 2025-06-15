part of 'auth_bloc.dart';

sealed class AuthEvent {}

//Selection if the Country from the Map
final class CountrySelected extends AuthEvent {
  final String countryName;
  final String countryCode;

  CountrySelected({required this.countryName, required this.countryCode,});
}

//Change in Country Code TextField
final class CountryCodeChanged extends AuthEvent{
  final String countryCode;

  CountryCodeChanged({required this.countryCode});
}

final class PhoneNumberChanged extends AuthEvent{
  final String countryCode;
  final String phoneNumber;

  PhoneNumberChanged({required this.countryCode, required this.phoneNumber});
}

//NextButton Clicked
final class NextButtonClicked extends AuthEvent {
  final String countryCode;
  final String phoneNumber;

  NextButtonClicked({
    required this.countryCode,
    required this.phoneNumber,
  });
}

//Otp Verification event
final class SendOtp extends AuthEvent {
  final String phoneNumber;

  SendOtp(this.phoneNumber);
}



//Otp is entered by user
final class OtpChanged extends AuthEvent{
  final String otp;

  OtpChanged({required this.otp });
}

//Verifying OTP
final class VerifyOtp extends AuthEvent {
  final String verificationId;
  final String otp;
  final String phoneNumber;

  VerifyOtp(this.verificationId, this.otp, this.phoneNumber);
}
