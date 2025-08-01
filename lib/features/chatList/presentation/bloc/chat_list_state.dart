part of 'chat_list_bloc.dart';

sealed class ChatListState {}

final class ChatListInitial extends ChatListState {}

class ChatListLoaded extends ChatListState {
  final List<ChatListEntity?> chatList;

  ChatListLoaded(this.chatList);
}

class ChatListError extends ChatListState {}

class NavigateToSetting extends ChatListState {}

class NavigateToChat extends ChatListState {
  final String conversationId;
  final String otherUserId;
  final String otherUserName;
  final String otherUserProfileImage;

  NavigateToChat({
    required this.conversationId,
    required this.otherUserId,
    required this.otherUserName,
    required this.otherUserProfileImage,
  });
}
