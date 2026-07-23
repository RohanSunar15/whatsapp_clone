import 'package:whatsapp_clone/features/chat/domain/entities/chat_entity.dart';

abstract class ChatRepository {
  Future<List<ChatEntity?>> getChatMessage(String conversationId);
  Future<void> sendMessage({
    required String conversationId,
    required String receiverId,
    required String text,
  });
}
