import 'package:whatsapp_clone/core/widgets/common/date_formatter.dart';

class ChatListEntity {
  final String conversationId;
  final String lastMessage;
  final DateTime timestamp;
  final String otherUserId;
  final String otherUserName;
  final String otherUserProfileImage;
  final int unreadCount;
  final bool isCall;
  final String callType;
  final String callStatus;
  final String status;

  ChatListEntity({
    required this.conversationId,
    required this.lastMessage,
    required this.timestamp,
    required this.otherUserId,
    required this.otherUserName,
    required this.otherUserProfileImage,
    required this.unreadCount,
    required this.isCall,
    required this.callType,
    required this.callStatus,
    required this.status,
  });

  //
  String get formattedTimestamp => formatChatTimestamp(timestamp);

  @override
  String toString() {
    return 'ChatData(conversationId: $conversationId, '
        'lastMessage: $lastMessage, '
        'timestamp: $formattedTimestamp '
        'otherUserId: $otherUserId, '
        'otherUserId: $otherUserId, '
        'otherUserName: $otherUserProfileImage)'
        'unreadCount: $unreadCount)'
        'isCall: $isCall)'
        'callType: $callType)'
        'callStatus: $callStatus)'
        'status: $status)';
  }
}
