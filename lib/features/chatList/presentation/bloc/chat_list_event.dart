part of 'chat_list_bloc.dart';

@immutable
sealed class ChatListEvent {}

class LoadChatList extends ChatListEvent {}

//Show menu List Event
class NewGroupTapped extends ChatListEvent {}

class NewCommunityTapped extends ChatListEvent {}

class NewBroadcastTapped extends ChatListEvent {}

class LinkedDevicesTapped extends ChatListEvent {}

class StarredTapped extends ChatListEvent {}

class PaymentsTapped extends ChatListEvent {}

class ReadAllTapped extends ChatListEvent {}

class SettingsTapped extends ChatListEvent {}

// Appbar Icon Event

class CameraIconTapped extends ChatListEvent {}

class QRScannerIconTapped extends ChatListEvent {}

class ChatTileClicked extends ChatListEvent {
  final String conversationId;
  final String otherUserId;
  final String otherUserName;
  final String otherUserProfileImage;

  ChatTileClicked({
    required this.conversationId,
    required this.otherUserId,
    required this.otherUserName,
    required this.otherUserProfileImage,
  });
}
