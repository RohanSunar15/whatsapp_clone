import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_icon_text_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade300, // or any border color
            height: 1.0,
          ),
        ),
        leadingWidth: 30,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.jpg'),
                      radius: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name', style: TextStyle(fontSize: 20)),
                        Text(
                          'Busy',
                          style: TextStyle(fontSize: 15, color: AppColor.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.qr_code_rounded,
                        color: AppColor.lightGreen,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add_circle_outline_outlined,
                        color: AppColor.lightGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            IconTextTile(
              icon: Icons.key_rounded,
              title: 'Account',
              value: 'Security notifications, change number',
            ),
            IconTextTile(
              icon: Icons.lock_outline_rounded,
              title: 'Privacy',
              value: 'Block contacts, disappearing messages',
            ),
            IconTextTile(
              icon: Icons.person,
              title: 'Avatar',
              value: 'Create, edit, profile photo',
            ),
            IconTextTile(
              icon: Icons.account_box_outlined,
              title: 'Lists',
              value: 'Manage people and groups',
            ),
            IconTextTile(
              icon: Icons.message_outlined,
              title: 'Chats',
              value: 'Theme, wallpapers, chat history',
            ),
            IconTextTile(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              value: 'Message, group & call tones',
            ),
            IconTextTile(
              icon: Icons.data_usage_outlined,
              title: 'Storage and data',
              value: 'Network usage, auto-download',
            ),
            IconTextTile(
              icon: Icons.language,
              title: 'App Language',
              value: 'English (device\'s language)',
            ),
            IconTextTile(
              icon: Icons.help_outline_outlined,
              title: 'Help',
              value: 'Help centre, contact us, privacy policy',
            ),
            IconTextTile(icon: Icons.group_outlined, title: 'Invite a friend'),
            IconTextTile(icon: Icons.phone_android_sharp, title: 'App updates'),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Also from Meta',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            IconTextTile(
              icon: FontAwesomeIcons.instagram,
              title: 'Open Instagram',
            ),
            IconTextTile(icon: Icons.facebook_outlined, title: 'Open Facebook'),
            IconTextTile(icon: FontAwesomeIcons.threads, title: 'Open Threads'),
            IconTextTile(
              icon: Icons.circle_outlined,
              title: 'Open Meta AI app',
            ),
          ],
        ),
      ),
    );
  }
}
