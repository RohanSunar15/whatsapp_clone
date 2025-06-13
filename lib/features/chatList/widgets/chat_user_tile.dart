import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/data/chat_data.dart';

class ChatUserTileWidget extends StatelessWidget {
  final ChatData chat;
  final Function() onTap;

  const ChatUserTileWidget(
      {super.key, required this.chat, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColor.userBackgroundColor,
            backgroundImage: chat.profileImage != null
                ? NetworkImage(chat.profileImage!)
                : null,
            child: chat.profileImage == null
                ? Icon(Icons.person, size: 28, color: Colors.white)
                : null,
          ),
          if (chat.isGroup)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.lightGreen,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.grey, width: 2),
                ),
                padding: EdgeInsets.all(2),
                child: Icon(Icons.group, size: 14, color: Colors.white),
              ),
            ),
        ],
      ),
      title: Text(
        chat.name,
        style: TextStyle(
          color: AppColor.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Row(
        children: [
          if (chat.isVoiceCall)
            Icon(
              chat.isMissedCall ? Icons.call_missed : Icons.call,
              color: chat.isMissedCall ? Colors.red : Colors.green,
              size: 16,
            ),
          if (chat.isVoiceCall) SizedBox(width: 4),
          Expanded(
            child: Text(
              chat.message,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColor.black,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            chat.time,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 6),
          if (chat.unreadCount > 0)
            CircleAvatar(
              radius: 12,
              backgroundColor: AppColor.lightGreen,
              child: Text(
                chat.unreadCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}
