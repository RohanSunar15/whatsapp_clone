part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


final class CountrySelected extends AuthEvent {
  final String countryName;
  final String countryCode;

  CountrySelected({required this.countryName, required this.countryCode});
}

final class CountryCodeChanged extends AuthEvent{
  final String countryCode;

  CountryCodeChanged(this.countryCode);
}


final class PhoneNumberChanged extends AuthEvent{
  final String phoneNumber;

  PhoneNumberChanged({required this.phoneNumber});
}
