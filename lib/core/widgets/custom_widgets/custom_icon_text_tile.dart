import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';

class CustomIconTextTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  final Color? valueColor;
  final FontWeight? valueFontWeight;
  final VoidCallback? onTap;
  final Color? iconColor;
  final bool isSuffixIcon;

  const CustomIconTextTile({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    this.valueColor,
    this.valueFontWeight,
    this.onTap,
    this.iconColor,
    this.isSuffixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
        icon, size: 24, color: iconColor ?? Colors.grey[700]);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: isSuffixIcon
              ? [
            Expanded(
              child: _buildTextContent(),
            ),
            const SizedBox(width: 16),
            iconWidget,
          ]
              : [
            // Icon first, then text
            iconWidget,
            const SizedBox(width: 16),
            Expanded(
              child: _buildTextContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            color: AppColor.black,
          ),
        ),
        const SizedBox(height: 2),
        if (value != null)
          Text(
            value!,
            style: TextStyle(
              fontSize: 12,
              fontWeight: valueFontWeight ?? FontWeight.normal,
              color: valueColor ?? AppColor.grey,
            ),
          ),
      ],
    );
  }
}
