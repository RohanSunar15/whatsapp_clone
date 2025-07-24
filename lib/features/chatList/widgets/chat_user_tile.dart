import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/features/chatList/domain/entities/chatlist_entity.dart';

class ChatUserTileWidget extends StatelessWidget {
  final ChatListEntity chat;
  final Function() onTap;

  const ChatUserTileWidget({
    super.key,
    required this.chat,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColor.userBackgroundColor,
            backgroundImage:
                chat.otherUserProfileImage.isNotEmpty
                    ? NetworkImage(chat.otherUserProfileImage)
                    : null,
            child:
                chat.otherUserProfileImage.isEmpty
                    ? Icon(Icons.person, size: 28, color: Colors.white)
                    : null,
          ),
          // if (chat.isGroup)
          //   Positioned(
          //     bottom: 0,
          //     right: 0,
          //     child: Container(
          //       decoration: BoxDecoration(
          //         color: AppColor.lightGreen,
          //         shape: BoxShape.circle,
          //         border: Border.all(color: AppColor.grey, width: 2),
          //       ),
          //       padding: EdgeInsets.all(2),
          //       child: Icon(Icons.group, size: 14, color: Colors.white),
          //     ),
          //   ),
        ],
      ),
      title: Text(
        chat.otherUserName,
        style: TextStyle(
          color: AppColor.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Row(
        children: [
          if (chat.isCall == true)
            Icon(
              chat.callStatus == 'missed' ? Icons.call_missed : Icons.call,
              color: chat.callStatus == 'missed' ? Colors.red : Colors.green,
              size: 16,
            ),
          if (chat.isCall == false) SizedBox(width: 4),
          Icon(
            chat.status == 'sent' ? Icons.done_all : Icons.done,
            color: AppColor.blue,
            size: 16,
          ),
          SizedBox(width: 4),
          Expanded(
            child: Text(
              chat.lastMessage,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: AppColor.black, fontSize: 14),
            ),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            chat.formattedTimestamp,
            style: TextStyle(color: AppColor.black, fontSize: 12),
          ),
          SizedBox(height: 6),
          if (chat.unreadCount > 0)
            CircleAvatar(
              radius: 12,
              backgroundColor: AppColor.lightGreen,
              child: Text(
                chat.unreadCount.toString(),
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}
