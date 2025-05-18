import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';

class ChatUserTileWidget extends StatefulWidget {
  const ChatUserTileWidget({super.key});

  @override
  State<ChatUserTileWidget> createState() => _ChatUserTileWidgetState();
}

class _ChatUserTileWidgetState extends State<ChatUserTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.userBackgroundColor,
                radius: 20,
                child: Icon(Icons.person),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User 1',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User\'s message ',
                    style: TextStyle(color: AppColor.black, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Yesterday',
                style: TextStyle(fontSize: 11, color: AppColor.black,),
              ),
              SizedBox(height: 5,),
              CircleAvatar(
                backgroundColor: AppColor.lightGreen,
                radius: 10,
                child: Text('1', style: TextStyle(fontSize: 10)),
              ),
            ],
          ),
        ],
      ),
      tileColor: AppColor.grey,
      // selected: true,
    );
  }
}
