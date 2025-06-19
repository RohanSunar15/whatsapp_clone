import 'package:whatsapp_clone/features/auth/domain/repositories/auth_repository.dart';

class SendTokenUseCase {
  final AuthRepository repository;

  SendTokenUseCase(this.repository);

  Future<bool> call(String idToken) {
    return repository.sendIdTokenToBackend(idToken);
  }
}
