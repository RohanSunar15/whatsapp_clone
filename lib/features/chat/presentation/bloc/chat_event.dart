part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

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

  SendMessageButtonClicked({required this.text, required this.receiverId});
}

class MessageTextChanged extends ChatEvent {
  final String text;

  MessageTextChanged(this.text);
}
