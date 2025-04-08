import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CountrySelected>((event, emit) {
      emit(AuthCountrySelected(
          countryName: event.countryName,
          countryCode: event.countryCode)
      );
    });

    on<ChangedCountryCode>((event, emit) {

    });
  }
}
