import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  final String userImage;

  const ChatScreen({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  State<ChatScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [
    {"text": "Hey there!", "isMe": false},
    {"text": "Hi! How are you?", "isMe": true},
    {"text": "All good! You?", "isMe": false},
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({"text": _controller.text.trim(), "isMe": true});
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightModeBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.lightGreen,
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(widget.userImage)),
            const SizedBox(width: 10),
            Text(widget.userName, style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[_messages.length - 1 - index];
                final isMe = msg["isMe"] as bool;

                return Align(
                  alignment:
                      isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    decoration: BoxDecoration(
                      color: isMe ? AppColor.lightGreen : Colors.grey.shade300,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(12),
                        topRight: const Radius.circular(12),
                        bottomLeft:
                            isMe
                                ? const Radius.circular(12)
                                : const Radius.circular(0),
                        bottomRight:
                            isMe
                                ? const Radius.circular(0)
                                : const Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      msg["text"],
                      style: TextStyle(
                        color: isMe ? Colors.white : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: AppColor.lightGreen),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
