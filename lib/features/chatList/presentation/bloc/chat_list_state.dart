part of 'chat_list_bloc.dart';

sealed class ChatListState {}

final class ChatListInitial extends ChatListState {}

class ChatListLoaded extends ChatListState {
  final List<ChatListEntity?> chatList;

  ChatListLoaded(this.chatList);
}

class ChatListError extends ChatListState {}

class NavigateToSetting extends ChatListState {}
