part of 'chat_list_bloc.dart';

@immutable
sealed class ChatListEvent {}

class LoadChatList extends ChatListEvent {}

//Show menu List Event
class NewGroupTapped extends ChatListEvent {}

class NewCommunityTapped extends ChatListEvent {}

class NewBroadcastTapped extends ChatListEvent {}

class LinkedDevicesTapped extends ChatListEvent {}

class StarredTapped extends ChatListEvent {}

class PaymentsTapped extends ChatListEvent {}

class ReadAllTapped extends ChatListEvent {}

class SettingsTapped extends ChatListEvent {}

// Appbar Icon Event

class CameraIconTapped extends ChatListEvent {}

class QRScannerIconTapped extends ChatListEvent {}
