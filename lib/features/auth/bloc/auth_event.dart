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

// //Change in Phone Number TextField
// final class PhoneNumberChanged extends AuthEvent{
//   final String phoneNumber;
//
//   PhoneNumberChanged({required this.phoneNumber,});
// }


//NextButton Clicked
final class NextButtonClicked extends AuthEvent {
  final String countryCode;
  final String phoneNumber;

  NextButtonClicked({
    required this.countryCode,
    required this.phoneNumber,
  });
}

// When next is clicked Sending otp is triggered
final class SendOtp extends AuthEvent {}

//Verifying OTP
final class VerifyOtp extends AuthEvent {}

// OTP has been Sent
final class OtpSent extends AuthEvent {}

//Any Error Occurs
final class AuthError extends AuthEvent {}
