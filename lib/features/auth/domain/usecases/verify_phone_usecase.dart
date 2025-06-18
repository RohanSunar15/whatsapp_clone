import 'package:whatsapp_clone/features/auth/data/repositories/auth_repository.dart';

class VerifyPhoneUseCase {
  final AuthRepository repository;

  VerifyPhoneUseCase(this.repository);

  Future<void> call(
    String phoneNumber,
    Function(String) onCodeSent,
    Function(String) onAutoVerified,
    Function(String) onFailed,
  ) {
    return repository.verifyPhone(
      phoneNumber,
      onCodeSent,
      onAutoVerified,
      onFailed,
    );
  }
}
