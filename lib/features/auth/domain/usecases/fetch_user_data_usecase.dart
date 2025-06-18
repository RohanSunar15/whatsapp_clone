import 'package:whatsapp_clone/features/auth/data/repositories/auth_repository.dart';
import 'package:whatsapp_clone/features/auth/domain/entities/user.entity.dart';

class FetchUserDataUseCase {
  final AuthRepository repository;

  FetchUserDataUseCase(this.repository);

  Future<UserEntity?> call(String phoneNumber) {
    return repository.fetchUserData(phoneNumber);
  }
}
