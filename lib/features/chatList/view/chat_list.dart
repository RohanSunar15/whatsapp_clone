import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/features/chatList/bloc/chat_list_bloc.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.more_vert_outlined),
          ),
        ]

      ),
      body: Center(
        child: Column(
          children: [
            SearchBarWidget(),
            ChatUserTileWidget(),
          ],
        )
      ),
    );
  }
}
