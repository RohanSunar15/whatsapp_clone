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
    on<SendMessageButtonClicked>(sendMessage);
  }

  FutureOr<void> loadChatMessage(
    LoadChatMessage event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final data = await chatRepositoryImpl.getChatMessage(
        event.conversationId,
      );
      emit(ChatMessageLoaded(chatMessage: data));
    } catch (error) {
      emit(ChatErrorMessage(errorMessage: error.toString()));
    }
  }

  FutureOr<void> backButtonClicked(
    BackButtonClicked event,
    Emitter<ChatState> emit,
  ) {}

  FutureOr<void> messageTextChanged(
    MessageTextChanged event,
    Emitter<ChatState> emit,
  ) {
    emit(MessageInputChanged(event.text.isNotEmpty));
  }

  FutureOr<void> sendMessage(
    SendMessageButtonClicked event,
    Emitter<ChatState> emit,
  ) async {
    try {
      await chatRepositoryImpl.sendMessage(
        conversationId: event.conversationId,
        receiverId: event.receiverId,
        text: event.text,
      );
      final data = await chatRepositoryImpl.getChatMessage(event.conversationId);
      emit(ChatMessageLoaded(chatMessage: data));
    } catch (error) {
      emit(ChatErrorMessage(errorMessage: error.toString()));
    }
  }
}
