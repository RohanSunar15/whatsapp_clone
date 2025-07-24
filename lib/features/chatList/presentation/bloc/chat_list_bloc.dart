import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp_clone/features/chatList/domain/entities/chatlist_entity.dart';
import 'package:whatsapp_clone/features/chatList/domain/repositories/chatlist_repository.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final ChatListRepository chatListRepository;

  ChatListBloc(this.chatListRepository) : super(ChatListInitial()) {
    on<LoadChatList>(loadChatList);
    on<SettingsTapped>(_settingsTapped);
  }

  FutureOr<void> loadChatList(
    LoadChatList event,
    Emitter<ChatListState> emit,
  ) async {
    try {
      final data = await chatListRepository.getChatList();
      print(data);
      emit(ChatListLoaded(data));
    } catch (error) {
      emit(ChatListError());
    }
  }

  FutureOr<void> _settingsTapped(
    SettingsTapped event,
    Emitter<ChatListState> emit,
  ) {
    emit(NavigateToSetting());
  }
}
