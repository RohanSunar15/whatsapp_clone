import 'package:whatsapp_clone/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> verifyPhone(
    String phoneNumber,
    Function(String) onCodeSent,
    Function(String) onAutoVerified,
    Function(String) onFailed,
  );

  Future<UserEntity?> verifyOTP(
    String verificationId,
    String otp,
    String phoneNumber,
  );

  Future<UserEntity?> sendIdTokenToBackend(String idToken);

  // Future<UserEntity?> fetchUserData(String phoneNumber);

  bool get isLoggedIn;
}
