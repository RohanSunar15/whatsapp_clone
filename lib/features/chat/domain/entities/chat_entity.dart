class ChatEntity {
  final String id;
  final String senderId;
  final String receiverId;
  final String text;
  final String conversationId;
  final int unreadCount;
  final bool isCall;
  final String callType;
  final String callStatus;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ChatEntity({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.conversationId,
    required this.unreadCount,
    required this.isCall,
    required this.callType,
    required this.callStatus,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}
