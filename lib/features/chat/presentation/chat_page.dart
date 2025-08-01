import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/common/date_formatter.dart';
import 'package:whatsapp_clone/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:whatsapp_clone/features/chat/widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  final String userImage;
  final String conversationId;

  const ChatScreen({
    super.key,
    required this.userName,
    required this.userImage,
    required this.conversationId,
  });

  @override
  State<ChatScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  bool showSend = false;

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(
      LoadChatMessage(conversationId: widget.conversationId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ChatMessageLoaded) {
          final box = Hive.box('authBox');
          final userId = box.get('mongoId');

          final chatMessage = state.chatMessage;

          return Scaffold(
            backgroundColor: AppColor.cream,
            appBar: AppBar(
              backgroundColor: AppColor.white,
              title: Row(
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(widget.userImage)),
                  const SizedBox(width: 10),
                  Text(widget.userName, style: TextStyle(fontSize: 17)),
                  Spacer(),
                  Icon(Icons.videocam_outlined, size: 35),
                  SizedBox(width: 20),
                  Icon(Icons.phone_outlined, size: 30),
                  SizedBox(width: 20),
                  Icon(Icons.more_vert, size: 30),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.all(12),
                    itemCount: chatMessage.length,
                    itemBuilder: (context, index) {
                      final msg = chatMessage[chatMessage.length - 1 - index];
                      if (msg == null) return SizedBox();
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.emoji_emotions_outlined),
                          ),
                          Expanded(
                            child: TextField(
                              controller: messageController,
                              onChanged: (text) {
                                context.read<ChatBloc>().add(
                                  MessageTextChanged(text),
                                );
                              },
                              minLines: 1,
                              maxLines: 6,
                              keyboardType: TextInputType.multiline,
                              cursorColor: AppColor.lightGreen,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: "Message",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Icon(Icons.attach_file_outlined),
                          SizedBox(width: 10),
                          if (!showSend)
                            Row(
                              children: [
                                Icon(Icons.currency_rupee),
                                SizedBox(width: 10),
                                Icon(Icons.camera_alt_outlined),
                                SizedBox(width: 10),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 7),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: AppColor.lightGreen,
                    ),
                    child: IconButton(
                      icon: Icon(
                        showSend ? Icons.send : Icons.mic,
                        color: AppColor.white,
                      ),
                      onPressed: () {
                        final text = messageController.text;
                        if (text.isNotEmpty) {
                          // context.read<ChatBloc>().add(
                          //   SendMessageButtonClicked(),
                          // );
                          print(text);
                          messageController.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(body: Center(child: Text('NO MESSAGE ')));
      },
    );
  }
}
