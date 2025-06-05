import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_button.dart';

class NumberChangeInfoScreen extends StatefulWidget {
  const NumberChangeInfoScreen({super.key});

  @override
  State<NumberChangeInfoScreen> createState() => _NumberChangeInfoScreenState();
}

class _NumberChangeInfoScreenState extends State<NumberChangeInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        title: Text(
          'Change number',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: Center(
                child: Image.asset(
                  'assets/images/number_changed.jpg',
                  scale: 3,
                ),
              ),
            ),
            Text(
              'Changing your phone number will migrate your account info, groups & settings.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              'Before proceeding, please confirm that you are able to receive SMS or calls at your new number.',
              style: TextStyle(color: AppColor.grey, fontSize: 12),
            ),
            SizedBox(height: 20),
            Text(
              'If you have both a new phone & a new number, first change your number on your old phone.',
              style: TextStyle(color: AppColor.grey, fontSize: 12),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomOutlinedButton(
                childWidget: Text(
                  'Next',
                  style: TextStyle(color: AppColor.white, fontSize: 14),
                ),
                borderRadius: 50,
                backgroundColor: AppColor.lightGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
