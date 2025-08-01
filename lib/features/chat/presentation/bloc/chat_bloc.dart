import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whatsapp_clone/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:whatsapp_clone/features/chat/domain/entities/chat_entity.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepositoryImpl chatRepositoryImpl;
  ChatBloc(this.chatRepositoryImpl) : super(ChatInitial()) {
    on<LoadChatMessage>(loadChatMessage);
    on<BackButtonClicked>(backButtonClicked);

    on<MessageTextChanged>(messageTextChanged);
  }

  FutureOr<void> loadChatMessage(
    LoadChatMessage event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final data = await chatRepositoryImpl.getChatMessage(
        event.conversationId,
      );
      print(data);

      if (data.isEmpty) {
        emit(ChatErrorMessage(errorMessage: 'No message found'));
      }

      emit(ChatMessageLoaded(chatMessage: data));
    } catch (error) {
      emit(ChatErrorMessage(errorMessage: error.toString()));
    }
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
