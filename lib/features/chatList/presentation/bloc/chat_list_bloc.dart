import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  ChatListBloc() : super(ChatListInitial()) {
    on<ChatListEvent>((event, emit) {});
    on<SettingsTapped>(_settingsTapped);
  }


  FutureOr<void> _settingsTapped(SettingsTapped event,
      Emitter<ChatListState> emit) {
    emit(NavigateToSetting());
  }
}
