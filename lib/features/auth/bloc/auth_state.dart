part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthCountrySelected extends AuthState{
  final String countryName;
  final String countryCode;

  AuthCountrySelected({required this.countryName, required this.countryCode});
}

class CountryCodeInvalid extends AuthState{
  final String countryCode;

  CountryCodeInvalid({required this.countryCode});
}