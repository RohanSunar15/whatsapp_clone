import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';

class IconTextTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  final Color? valueColor;
  final FontWeight? valueFontWeight;
  final VoidCallback? onTap;
  final Color? iconColor;



  const IconTextTile({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    this.valueColor,
    this.valueFontWeight,
    this.onTap,
    this.iconColor,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: iconColor ?? Colors.grey[700],),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColor.black,
                      )),
                  const SizedBox(height: 2),
                  if(value != null)
                  Text(
                    value!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:  valueFontWeight ?? FontWeight.normal,
                      color: valueColor ?? AppColor.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
