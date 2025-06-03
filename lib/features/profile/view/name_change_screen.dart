import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_button.dart';

class NameChangeScreen extends StatefulWidget {
  const NameChangeScreen({super.key});

  @override
  State<NameChangeScreen> createState() => _NameChangeScreenState();
}

class _NameChangeScreenState extends State<NameChangeScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: ' Full Name',
  );
  final int _maxLength = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        title: Text(
          'Name',
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              maxLength: _maxLength,
              decoration: InputDecoration(
                labelText: 'Your name',
                labelStyle: TextStyle(color: AppColor.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.grey,
                ),
                counterText: '${_nameController.text.length}/$_maxLength',
              ),
              onChanged: (value) {
                setState(() {}); // to update counter
              },
            ),
            SizedBox(height: 5,),
            Text(
              'People will see this name if you interact with them and they don\'t have you saved as a contact.',
              style: TextStyle(
                color: AppColor.grey,
                fontSize: 13
              ),
            ),
            Spacer(),
            CustomOutlinedButton(
              childWidget: Text(
                'Save',
                style: TextStyle(color: AppColor.white, fontSize: 15),
              ),
              width: double.infinity,
              borderRadius: 50,
              backgroundColor: AppColor.lightGreen,
            ),
          ],
        ),
      ),
    );
  }
}
