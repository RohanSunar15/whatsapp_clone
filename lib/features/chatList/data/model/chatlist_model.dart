import 'package:whatsapp_clone/features/chatList/domain/entities/chatlist_entity.dart';

class ChatListModel extends ChatListEntity {
  ChatListModel({
    required super.conversationId,
    required super.lastMessage,
    required super.timestamp,
    required super.otherUserId,
    required super.otherUserName,
  });

  factory ChatListModel.fromJson(Map<String, dynamic> json) {
    final otherUser = json['otherUser'];
    return ChatListModel(
      conversationId: json['conversationId'],
      lastMessage: json['lastMessage'],
      timestamp: DateTime.parse(json['timestamp']),
      otherUserId: otherUser['_id'],
      otherUserName: otherUser['name'],
    );
  }
}
