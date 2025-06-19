import 'package:whatsapp_clone/features/auth/domain/entities/user.entity.dart';
import 'package:whatsapp_clone/features/auth/domain/repositories/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<UserEntity?> call(
    String verificationId,
    String otp,
    String phoneNumber,
  ) {
    return repository.verifyOTP(verificationId, otp, phoneNumber);
  }
}
