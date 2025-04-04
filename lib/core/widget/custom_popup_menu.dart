import 'package:flutter/material.dart';

class CustomPopupMenu extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String> onSelected;
  final String hintText;
  final Color borderColor;
  final double borderRadius;

  const CustomPopupMenu({
    super.key,
    required this.items,
    required this.onSelected,
    this.selectedValue,
    this.hintText = "Select an option",
    this.borderColor = Colors.grey,
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: PopupMenuButton<String>(
        onSelected: onSelected,
        itemBuilder: (BuildContext context) {
          return items.map((String item) {
            return PopupMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(selectedValue ?? hintText),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
