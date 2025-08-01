import 'package:whatsapp_clone/features/chat/domain/entities/chat_entity.dart';

abstract class ChatRepository {
  Future<List<ChatEntity?>> getChatMessage(String conversationId);
}
