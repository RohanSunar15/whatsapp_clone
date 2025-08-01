part of 'chat_bloc.dart';

@immutable
sealed class ChatState {}

final class ChatMessageLoaded extends ChatState {
  final List<ChatEntity?> chatMessage;

  ChatMessageLoaded({required this.chatMessage});
}

final class ChatInitial extends ChatState {}

class NavigateToChatList extends ChatState {}

class StartVideoCall extends ChatState {}

class StartVoiceCall extends ChatState {}

class OpenMenuList extends ChatState {}

class OpenEmojiPanel extends ChatState {}

class ShowAttachmentOptions extends ChatState {}

class NavigateToUpi extends ChatState {}

class OpenCamera extends ChatState {}

class StartRecording extends ChatState {}

class MessageInputChanged extends ChatState {
  final bool showSendButton;

  MessageInputChanged(this.showSendButton);
}

class ChatErrorMessage extends ChatState {
  final String errorMessage;

  ChatErrorMessage({required this.errorMessage});
}
