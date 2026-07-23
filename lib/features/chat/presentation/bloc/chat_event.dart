part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

class LoadChatMessage extends ChatEvent {
  final String conversationId;

  LoadChatMessage({required this.conversationId});
}

class MarkMessageSeen extends ChatEvent {
  final String conversationId;
  final String messageId;

  MarkMessageSeen({required this.conversationId, required this.messageId});
}

class BackButtonClicked extends ChatEvent {}

class VideoCallButtonClicked extends ChatEvent {}

class VoiceCallButtonClicked extends ChatEvent {}

class ThreeDotButtonClicked extends ChatEvent {}

class ButtonClicked extends ChatEvent {}

class EmojiButtonClicked extends ChatEvent {}

class AttachFileButtonClicked extends ChatEvent {}

class UpiPaymentButtonClicked extends ChatEvent {}

class CameraButtonClicked extends ChatEvent {}

class MicButtonClicked extends ChatEvent {}

class SendMessageButtonClicked extends ChatEvent {
  final String text;
  final String receiverId;
  final String conversationId;

  SendMessageButtonClicked({
    required this.text,
    required this.receiverId,
    required this.conversationId,
  });
}

class MessageTextChanged extends ChatEvent {
  final String text;

  MessageTextChanged(this.text);
}
