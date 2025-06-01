import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_icon_text_tile.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_text_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade300, // or any border color
            height: 1.0,
          ),
        ),
        leadingWidth: 30,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 150,
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user.jpg'),
                  radius: 200,
                ),
              ),
            ),
          ),

          CustomTextButton(
            onPressed: () {},
            text: 'Edit',
            textColor: AppColor.green,
            fontSize: 14,
            overlayColor: AppColor.lightGreen,
          ),
          IconTextTile(
            icon: Icons.person_2_outlined,
            title: 'Name',
            value: 'Rohan Sunar',
          ),
          IconTextTile(
            icon: Icons.info_outline,
            title: 'About',
            value: 'Busy',
          ),
          IconTextTile(
            icon: Icons.phone_outlined,
            title: 'Phone',
            value: '+91 98341 50718',
          ),
          IconTextTile(
            icon: Icons.link_sharp,
            title: 'Links',
            value: 'Add links',
            valueColor: AppColor.green,
            valueFontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
