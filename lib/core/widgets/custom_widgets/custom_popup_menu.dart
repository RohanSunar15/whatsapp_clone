import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';

class CustomPopupMenu extends StatelessWidget {
  final List<String> items;
  final ValueChanged<String> onSelected;

  const CustomPopupMenu({
    super.key,
    required this.items,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (buttonContext) {
        return IconButton(
          icon: Icon(Icons.more_vert, color: AppColor.black),
          onPressed: () {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              final RenderBox button = buttonContext.findRenderObject() as RenderBox;
              final RenderBox overlay = Overlay.of(buttonContext).context.findRenderObject() as RenderBox;

              final position = RelativeRect.fromRect(
                Rect.fromPoints(
                  button.localToGlobal(Offset.zero, ancestor: overlay),
                  button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
                ),
                Offset.zero & overlay.size,
              );

              final selected = await showMenu<String>(
                context: buttonContext,
                position: position,
                color: Colors.grey[900],
                items: items.map((String item) {
                  return PopupMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(color: AppColor.black),
                    ),
                  );
                }).toList(),
              );

              if (selected != null) {
                onSelected(selected);
              }
            });
          },
        );
      },
    );
  }
}
