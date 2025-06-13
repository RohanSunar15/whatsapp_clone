part of 'chat_list_bloc.dart';

sealed class ChatListState {}

final class ChatListInitial extends ChatListState {}

class NavigateToSetting extends ChatListState {}
