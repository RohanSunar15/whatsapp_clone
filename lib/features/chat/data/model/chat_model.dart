import 'package:whatsapp_clone/features/chat/domain/entities/chat_entity.dart';

class ChatModel extends ChatEntity {
  const ChatModel({
    required super.id,
    required super.senderId,
    required super.receiverId,
    required super.text,
    required super.conversationId,
    required super.unreadCount,
    required super.isCall,
    required super.callType,
    required super.callStatus,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['_id'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      text: json['text'],
      conversationId: json['conversationId'],
      unreadCount: json['unreadCount'],
      isCall: json['isCall'],
      callType: json['callType'],
      callStatus: json['callStatus'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'conversationId': conversationId,
      'unreadCount': unreadCount,
      'isCall': isCall,
      'callType': callType,
      'callStatus': callStatus,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
