part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


class CountrySelected extends AuthEvent {
  final String countryName;
  final String countryCode;

  CountrySelected({required this.countryName, required this.countryCode});
}

class ChangedCountryCode extends AuthEvent{
  final String countryCode;

  ChangedCountryCode(this.countryCode);
}