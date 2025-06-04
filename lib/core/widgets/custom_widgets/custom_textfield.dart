import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLength;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.maxLength,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      cursorColor: AppColor.lightGreen,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColor.grey),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon:
            suffixIcon != null ? Icon(suffixIcon, color: Colors.grey) : null,
        counterText: '${controller.text.length}/$maxLength',
      ),
      onChanged: (value) {
        if (onChanged != null) onChanged!(value);
      },
    );
  }
}
