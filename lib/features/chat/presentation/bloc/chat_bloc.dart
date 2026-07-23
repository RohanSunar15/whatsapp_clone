import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    on<MarkMessageSeen>(markMessageSeen);
  }

  /// Subscribes to a real-time Firestore stream.
  /// Every time a new message is written, BLoC emits [ChatMessageLoaded]
  /// automatically — no manual refresh needed.
  Future<void> loadChatMessage(
    LoadChatMessage event,
    Emitter<ChatState> emit,
  ) async {
    await emit.forEach<List<ChatEntity>>(
      chatRepositoryImpl.getMessagesStream(event.conversationId),
      onData: (messages) => ChatMessageLoaded(chatMessage: messages),
      onError: (error, _) =>
          ChatErrorMessage(errorMessage: error.toString()),
    );
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
      // No manual reload needed: the Firestore stream emits the new message
      // and loadChatMessage will automatically push a new ChatMessageLoaded.
    } catch (error) {
      emit(ChatErrorMessage(errorMessage: error.toString()));
    }
  }

  FutureOr<void> markMessageSeen(
    MarkMessageSeen event,
    Emitter<ChatState> emit,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('conversations')
          .doc(event.conversationId)
          .collection('messages')
          .doc(event.messageId)
          .update({'status': 'seen'});
    } catch (_) {}
  }
}
