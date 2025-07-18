import 'package:whatsapp_clone/features/chatList/domain/entities/chatlist_entity.dart';
import 'package:whatsapp_clone/features/chatList/domain/repositories/chatlist_repository.dart';

class GetChatListUseCase {
  final ChatListRepository chatListRepository;

  GetChatListUseCase(this.chatListRepository);
  Future<List<ChatListEntity?>> call() {
    return chatListRepository.getChatList();
  }
}
