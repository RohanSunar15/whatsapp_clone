import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;
  final VoidCallback? onHover;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight, this.onHover,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
