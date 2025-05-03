part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState{}

final class AuthSuccess extends AuthState{}

final class AuthFailure extends AuthState{}

final class AuthCountrySelected extends AuthState{
  final String countryName;
  final String countryCode;

  AuthCountrySelected({required this.countryName, required this.countryCode});
}

final class CountryCodeInvalid extends AuthState{
  final String countryCode;

  CountryCodeInvalid({required this.countryCode});
}