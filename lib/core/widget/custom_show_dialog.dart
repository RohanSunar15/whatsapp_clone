import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/widget/custom_button.dart';

class CustomShowDialog extends StatelessWidget {
  final String title;
  final TextStyle style;
  final double dialogHeight;
  final double dialogWidth;

  const CustomShowDialog({
    super.key,
     this.title = "",
    required this.style,
     this.dialogHeight = 90,
     this.dialogWidth = 300,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: style),
      content: SizedBox(
        height: dialogHeight,
        width: dialogWidth,
        child: Column(
          children: [
            Text("+91 98341 50718 "),
            Row(children: [CustomOutlinedButton(childWidget: Text('Edit'))]),
          ],
        ),
      ),
    );
  }
}
