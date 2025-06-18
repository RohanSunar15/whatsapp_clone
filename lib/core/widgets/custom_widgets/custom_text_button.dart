import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;
  final VoidCallback? onHover;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? overlayColor;



  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.onHover,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(overlayColor ?? Colors.transparent),
        splashFactory: NoSplash.splashFactory,
        foregroundColor: WidgetStateProperty.all(textColor),
      ),
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
