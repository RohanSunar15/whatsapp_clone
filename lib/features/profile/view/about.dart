import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<String> aboutList = [
    'Available',
    'Busy',
    'At school',
    'At the movies',
    'At work',
    'Battery about to die',
    'Can\'t talk, WhatsApp only',
    'In a meeting',
    'At the gym',
    'Sleeping',
    'Urgent calls only',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        actions: [Icon(Icons.more_vert_outlined)],
        title: Text(
          'About',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        leadingWidth: 30,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColor.grey, width: 0.5),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Currently set to'),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Busy '),
                      Icon(Icons.edit_outlined, color: AppColor.lightGreen),
                    ],
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Select About',
              style: TextStyle(
                color: AppColor.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
