class ChatListEntity {
  final String conversationId;
  final String lastMessage;
  final DateTime timestamp;
  final String otherUserId;
  final String otherUserName;

  ChatListEntity({
    required this.conversationId,
    required this.lastMessage,
    required this.timestamp,
    required this.otherUserId,
    required this.otherUserName,
  });
}
