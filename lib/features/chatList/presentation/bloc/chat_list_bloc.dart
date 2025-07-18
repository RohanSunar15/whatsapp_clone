import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp_clone/features/chatList/domain/usecases/get_chat_list_usecase.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final GetChatListUseCase getChatListUseCase;

  ChatListBloc(this.getChatListUseCase) : super(ChatListInitial()) {
    on<LoadChatList>(loadChatList);
    on<ChatListEvent>((event, emit) {});
    on<SettingsTapped>(_settingsTapped);
  }

  FutureOr<void> loadChatList(
    LoadChatList event,
    Emitter<ChatListState> emit,
  ) async {
    try {
      emit(ChatListLoaded());
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
