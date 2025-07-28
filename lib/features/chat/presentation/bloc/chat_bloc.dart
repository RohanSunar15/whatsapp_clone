import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<BackButtonClicked>(backButtonClicked);

    on<MessageTextChanged>(messageTextChanged);
  }

  FutureOr<void> backButtonClicked(
    BackButtonClicked event,
    Emitter<ChatState> emit,
  ) {
    print('back button clicked');
  }

  FutureOr<void> messageTextChanged(
    MessageTextChanged event,
    Emitter<ChatState> emit,
  ) {
    final text = event.text;

    if (text.isEmpty) {
      emit(MessageInputChanged(false));
    } else {
      emit(MessageInputChanged(true));
    }
  }
}
