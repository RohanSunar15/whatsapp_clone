import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  ChatListBloc() : super(ChatListInitial()) {
    on<ChatListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
