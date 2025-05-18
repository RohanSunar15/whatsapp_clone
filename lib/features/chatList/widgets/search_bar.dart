import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(
        backgroundColor: WidgetStateProperty.all(AppColor.searchBoxColor),
        shadowColor: WidgetStateProperty.all(AppColor.transparent),
        hintText: 'Ask Meta AI or Search',
        hintStyle: WidgetStateProperty.all(
          TextStyle(color: AppColor.darkGrey, fontSize: 16),
        ),
        leading: Icon(Icons.search, color: AppColor.darkGrey),
      ),
    );
  }
}
