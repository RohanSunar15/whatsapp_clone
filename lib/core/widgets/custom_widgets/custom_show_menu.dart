  import 'package:flutter/material.dart';

  class CustomShowMenuItem {
    final String text;
    final VoidCallback onTap;
    final Color? textColor;
    final double? fontSize;
    final FontWeight? fontWeight;

    CustomShowMenuItem( {
      required this.text,
      required this.onTap,
      this.textColor,
      this.fontSize,
      this.fontWeight,
    });
  }

  Future<void> showCustomMenu({
    required BuildContext context,
    required Offset position,
    required List<CustomShowMenuItem> items,
  }) {
    return showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx,
        position.dy,
      ),
    elevation: 0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
      side: BorderSide(color: Colors.grey.shade300),
    ),
      items: items
          .map(
            (item) => PopupMenuItem(
              child: InkWell(
            onTap: () {
              Navigator.pop(context);
              item.onTap();
            },
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 100),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.text,
                  style: TextStyle(
                    color: item.textColor ?? Colors.black,
                    fontSize: item.fontSize ?? 14,
                    fontWeight: item.fontWeight ?? FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
      )
          .toList(),
    );
  }
