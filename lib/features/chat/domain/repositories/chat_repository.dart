import 'package:whatsapp_clone/features/chat/domain/entities/chat_entity.dart';

abstract class ChatRepository {
  /// Real-time stream of messages for [conversationId], ordered by time.
  /// Emits a new list every time a message is added, updated or deleted.
  Stream<List<ChatEntity>> getMessagesStream(String conversationId);

  Future<void> sendMessage({
    required String conversationId,
    required String receiverId,
    required String text,
  });
}
