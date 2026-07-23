import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/common/date_formatter.dart';
import 'package:whatsapp_clone/features/chat/domain/entities/chat_entity.dart';
import 'package:whatsapp_clone/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:whatsapp_clone/features/chat/widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  final String userImage;
  final String conversationId;
  final String receiverId;

  const ChatScreen({
    super.key,
    required this.userName,
    required this.userImage,
    required this.conversationId,
    required this.receiverId,
  });

  @override
  State<ChatScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  bool showSend = false;
  List<ChatEntity?> _messages = [];

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(
      LoadChatMessage(conversationId: widget.conversationId),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;
    context.read<ChatBloc>().add(
      SendMessageButtonClicked(
        text: text,
        receiverId: widget.receiverId,
        conversationId: widget.conversationId,
      ),
    );
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is MessageInputChanged) {
          setState(() => showSend = state.showSendButton);
        }
        if (state is ChatMessageLoaded) {
          setState(() => _messages = state.chatMessage);
        }
      },
      buildWhen: (previous, current) =>
          current is ChatInitial ||
          current is ChatMessageLoaded ||
          current is ChatErrorMessage,
      builder: (context, state) {
        if (state is ChatInitial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ChatErrorMessage) {
          return Scaffold(
            body: Center(child: Text(state.errorMessage)),
          );
        }

        final box = Hive.box('authBox');
        final userId = box.get('mongoId');

        return Scaffold(
          backgroundColor: AppColor.cream,
          appBar: AppBar(
            backgroundColor: AppColor.white,
            title: Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(widget.userImage)),
                const SizedBox(width: 10),
                Text(widget.userName, style: const TextStyle(fontSize: 17)),
                const Spacer(),
                const Icon(Icons.videocam_outlined, size: 35),
                const SizedBox(width: 20),
                const Icon(Icons.phone_outlined, size: 30),
                const SizedBox(width: 20),
                const Icon(Icons.more_vert, size: 30),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: _messages.isEmpty
                    ? const Center(
                        child: Text(
                          'No messages yet. Say hello! 👋',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        reverse: true,
                        padding: const EdgeInsets.all(12),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final msg =
                              _messages[_messages.length - 1 - index];
                          if (msg == null) return const SizedBox();
                          final isMe = msg.senderId == userId;
                          final isSeen = msg.status == 'seen';

                          return MessageBubble(
                            message: msg.text,
                            time: DateFormatter.formatToTime(msg.createdAt),
                            isMe: isMe,
                            isSeen: isSeen,
                          );
                        },
                      ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.emoji_emotions_outlined),
                        ),
                        Expanded(
                          child: TextField(
                            controller: messageController,
                            onChanged: (text) {
                              context
                                  .read<ChatBloc>()
                                  .add(MessageTextChanged(text));
                            },
                            onSubmitted: (_) => _sendMessage(),
                            minLines: 1,
                            maxLines: 6,
                            keyboardType: TextInputType.multiline,
                            cursorColor: AppColor.lightGreen,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Message",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Icon(Icons.attach_file_outlined),
                        const SizedBox(width: 10),
                        if (!showSend)
                          const Row(
                            children: [
                              Icon(Icons.camera_alt_outlined),
                              SizedBox(width: 10),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: AppColor.lightGreen,
                  ),
                  child: IconButton(
                    icon: Icon(
                      showSend ? Icons.send : Icons.mic,
                      color: AppColor.white,
                    ),
                    onPressed: showSend ? _sendMessage : null,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
