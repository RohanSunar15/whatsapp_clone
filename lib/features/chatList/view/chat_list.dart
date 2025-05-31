import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_show_menu.dart';
import 'package:whatsapp_clone/data/chat_data.dart';
import 'package:whatsapp_clone/features/chatList/widgets/chat_user_tile.dart';
import 'package:whatsapp_clone/features/chatList/widgets/search_bar.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('WhatsApp', style: TextStyle(
          color: AppColor.lightGreen,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.qr_code_scanner_outlined),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.camera_alt_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTapDown: (details) {
                showCustomMenu(
                  context: context,
                  position: details.globalPosition,
                  items: [
                    CustomShowMenuItem(
                      text: "New Group",
                      onTap: () => print("New Group tapped"),
                      textColor: AppColor.black,
                    ),
                    CustomShowMenuItem(
                      text: "New community",
                      onTap: () => print("New community tapped"),
                      textColor: AppColor.black,
                    ),
                    CustomShowMenuItem(
                      text: "New broadcast",
                      onTap: () => print("New broadcast tapped"),
                      textColor: AppColor.black,
                    ),
                    CustomShowMenuItem(
                      text: "Linked devices",
                      onTap: () => print("Linked devices tapped"),
                      textColor: AppColor.black,
                    ),
                    CustomShowMenuItem(
                      text: "Starred",
                      onTap: () => print("Starred tapped"),
                      textColor: AppColor.black,
                    ),
                    CustomShowMenuItem(
                      text: "Payments",
                      onTap: () => print("Payments tapped"),
                      textColor: AppColor.black,
                    ),
                    CustomShowMenuItem(
                      text: "Read all",
                      onTap: () => print("Read all tapped"),
                      textColor: AppColor.black,
                    ),
                    CustomShowMenuItem(
                      text: "Settings",
                      onTap: () => print("Settings tapped"),
                      textColor: AppColor.black,
                    ),
                  ],
                );
              },
              child: Icon(Icons.more_vert),
            ),
          )
        ]

      ),
      body: Center(
        child: Column(
          children: [
            SearchBarWidget(),
            Expanded(
              child: ListView.builder(
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  return ChatUserTileWidget(chat: chatList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
