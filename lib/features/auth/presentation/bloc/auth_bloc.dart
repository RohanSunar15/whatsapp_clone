import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:whatsapp_clone/features/auth/domain/repositories/auth_repository.dart';
import 'package:whatsapp_clone/features/countryCodePage/local_repository/country_code_data.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  String? _currentVerificationId;

  String? get currentVerificationId => _currentVerificationId;


  AuthBloc(this.repository) : super(AuthInitial()) {
    on<CountrySelected>(_countrySelected);
    on<CountryCodeChanged>(_countryCodeChanged);
    on<PhoneNumberChanged>(_phoneNumberChanged);
    on<NextButtonClicked>(_nextButtonClicked);
    on<EditButtonClicked>(_editButtonClicked);
    on<SendOtp>(_sendOtp);
    // otp screen
    on<OtpChanged>(_otpChanged);
    on<VerifyOtp>(_verifyOtp);
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
    final countryCode = event.countryCode;
    final phoneNumberEntered = event.phoneNumber;

    if (countryCode == '91') {
      String formatted;
      if (phoneNumberEntered.length > 5 && phoneNumberEntered.length < 11) {
        formatted = '${phoneNumberEntered.substring(0, 5)} ${phoneNumberEntered.substring(5)}';
      } else {
        formatted = phoneNumberEntered;
      }
      emit(PhoneNumberFormatted(formattedPhoneNumber: formatted));
    }
  }

  FutureOr<void> _nextButtonClicked(NextButtonClicked event,
      Emitter<AuthState> emit) async {
    final countryCode = event.countryCode;
    final phoneNumberEntered = event.phoneNumber;

    if (countryCode.isEmpty && phoneNumberEntered.isEmpty) {
      emit(FormBothFieldsEmpty());
    } else if (phoneNumberEntered.isEmpty) {
      emit(FormPhoneMissing());
    } else {
      emit(PhoneAuthLoading());
      await Future.delayed(Duration(seconds: 2));
      if (phoneNumberEntered.length < 11) {
        emit(PhoneNumberUnderLimit());
      } else if (phoneNumberEntered.length > 11) {
        emit(PhoneNumberExceedsLimit());
      } else {
        final phoneNumber = '+$countryCode $phoneNumberEntered';
        emit(AuthFormValidation(phoneWithCountryCode: phoneNumber));
      }
    }
  }

  FutureOr<void> _editButtonClicked(EditButtonClicked event,
      Emitter<AuthState> emit) {
    emit(BackToAuthScreen());
  }


//
  FutureOr<void> _sendOtp(SendOtp event, Emitter<AuthState> emit) async {
    emit(NavigateToOtpVerificationScreen(
        phoneWithCountryCode: event.phoneNumber));
    emit(OtpSendingLoading());


    await repository.verifyPhone(
      event.phoneNumber,
          (verificationId) async {
            _currentVerificationId = verificationId;
            if (!emit.isDone) emit(OtpSentState(verificationId));
      },
          (message) async {
        if (!emit.isDone) emit(Authenticated());
      },
          (error) async {
        if (!emit.isDone) emit(AuthFailure(message: error));
      },
    );
  }




//otp verification screen
  FutureOr<void> _otpChanged(OtpChanged event, Emitter<AuthState> emit) {
    final rawOtp = event.otp;

    final maxLength = 6;
    final placeholderChar = '_';

    final padded = rawOtp.padRight(maxLength, placeholderChar);

    final formatted = '${padded.substring(0, 3)} ${padded.substring(3)}';

    int cursor = rawOtp.length;
    if (cursor > 3) cursor += 1;
    emit(OtpUpdated(otp: formatted, cursorPosition: cursor));
    if (rawOtp.length == 6) {
      emit(OtpVerifying());
    }
  }



  FutureOr<void> _verifyOtp(VerifyOtp event, Emitter<AuthState> emit) async{
    if (_currentVerificationId == null) {
      emit(AuthFailure(message: "Verification ID missing"));
      return;
    }

    try {
      await repository.verifyOTP(
          _currentVerificationId!, event.otp, event.phoneNumber);
      emit(AuthSuccess());
    } catch (e) {
        emit(OtpVerificationFailure());
      }
  }

}
