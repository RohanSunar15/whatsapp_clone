import 'package:whatsapp_clone/features/auth/data/repositories/auth_repository.dart';
import 'package:whatsapp_clone/features/auth/domain/entities/user.entity.dart';

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
