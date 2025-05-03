import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whatsapp_clone/features/countryCodePage/local_repository/country_code_data.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CountrySelected>(_countrySelected);
    on<CountryCodeChanged>(_countryCodeChanged);
    on<PhoneNumberChanged>(_phoneNumberChanged);
  }

  FutureOr<void> _countrySelected(CountrySelected event, Emitter<AuthState> emit) {
    emit(AuthCountrySelected(
        countryName: event.countryName,
        countryCode: event.countryCode)
    );
  }

  FutureOr<void> _countryCodeChanged(CountryCodeChanged event, Emitter<AuthState> emit) {
    final inputCode = event.countryCode;
    MapEntry<String, Map<String, String>>? entry;

    if (inputCode.isEmpty) {
      emit(AuthCountrySelected(
        countryName: 'Choose a country',
        countryCode: inputCode,
      ));
      return null;
    }

    try {
      entry = CountryCodeList.countries.entries.firstWhere(
            (e) => e.value['code'] == inputCode,
      );

    } catch (e) {
      entry = null;
    }

    if (entry != null) {
      final countryName = entry.key;
      emit(AuthCountrySelected(
        countryName: countryName,
        countryCode: event.countryCode,
      ));
    } else {
      emit(AuthCountrySelected(
          countryName: 'invalid country code',
          countryCode: event.countryCode
      ));
    }
  }

  FutureOr<void> _phoneNumberChanged(PhoneNumberChanged event, Emitter<AuthState> emit) {
    final phoneNumberEntered = event.phoneNumber;
    print(phoneNumberEntered);


  }
}
