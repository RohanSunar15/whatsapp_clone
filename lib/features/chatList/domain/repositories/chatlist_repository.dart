import 'package:whatsapp_clone/features/chatList/domain/entities/chatlist_entity.dart';

abstract class ChatListRepository {
  Future<List<ChatListEntity?>> getChatList();
}
