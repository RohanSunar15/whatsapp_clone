import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widget/custom_button.dart';

class CustomShowDialog extends StatelessWidget {
  final Widget? title;
  final double dialogHeight;
  final double dialogWidth;
  final Widget widget;
  final ShapeBorder? shape;

  const CustomShowDialog({
    super.key,
     this.title,
     this.dialogHeight = 50,
     this.dialogWidth = 300,
    required this.widget,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:title,
      content: SizedBox(
        height: dialogHeight,
        width: dialogWidth,
        child: widget,

      ),
      shape: shape
    );
  }
}
