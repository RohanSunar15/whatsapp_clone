import 'package:whatsapp_clone/features/auth/domain/entities/user.entity.dart';
import 'package:whatsapp_clone/features/auth/domain/repositories/auth_repository.dart';

class FetchUserDataUseCase {
  final AuthRepository repository;

  FetchUserDataUseCase(this.repository);

  Future<UserEntity?> call(String phoneNumber) {
    return repository.fetchUserData(phoneNumber);
  }
}
