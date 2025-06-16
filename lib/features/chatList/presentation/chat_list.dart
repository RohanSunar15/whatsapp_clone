import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/core/widgets/common/app_navigator.dart';
import 'package:whatsapp_clone/core/widgets/custom_widgets/custom_show_menu.dart';
import 'package:whatsapp_clone/data/chat_data.dart';
import 'package:whatsapp_clone/features/chatList/presentation/bloc/chat_list_bloc.dart';
import 'package:whatsapp_clone/features/chatList/widgets/chat_user_tile.dart';
import 'package:whatsapp_clone/features/chatList/widgets/custom_bottom_nav_bar.dart';
import 'package:whatsapp_clone/features/chatList/widgets/search_bar.dart';
import 'package:whatsapp_clone/features/settings/presentation/settings.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatListBloc, ChatListState>(
      listener: (context, state) {
        if (state is NavigateToSetting) {
          AppNavigator.pushToScreen(context, SettingsScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              title: Text('WhatsApp', style: TextStyle(
                color: AppColor.lightGreen,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(Icons.qr_code_scanner_outlined),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(Icons.camera_alt_outlined),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTapDown: (details) {
                      showCustomMenu(
                        context: context,
                        position: details.globalPosition,
                        items: [
                          CustomShowMenuItem(
                            text: "New Group",
                            onTap: () => print("New Group tapped"),
                            textColor: AppColor.black,
                          ),
                          CustomShowMenuItem(
                            text: "New community",
                            onTap: () => print("New community tapped"),
                            textColor: AppColor.black,
                          ),
                          CustomShowMenuItem(
                            text: "New broadcast",
                            onTap: () => print("New broadcast tapped"),
                            textColor: AppColor.black,
                          ),
                          CustomShowMenuItem(
                            text: "Linked devices",
                            onTap: () => print("Linked devices tapped"),
                            textColor: AppColor.black,
                          ),
                          CustomShowMenuItem(
                            text: "Starred",
                            onTap: () => print("Starred tapped"),
                            textColor: AppColor.black,
                          ),
                          CustomShowMenuItem(
                            text: "Payments",
                            onTap: () => print("Payments tapped"),
                            textColor: AppColor.black,
                          ),
                          CustomShowMenuItem(
                            text: "Read all",
                            onTap: () => print("Read all tapped"),
                            textColor: AppColor.black,
                          ),
                          CustomShowMenuItem(
                            text: "Settings",
                            onTap: () =>
                                context.read<ChatListBloc>().add(
                                    SettingsTapped()),
                            textColor: AppColor.black,
                          ),
                        ],
                      );
                    },
                    child: Icon(Icons.more_vert),
                  ),
                )
              ]

          ),
          floatingActionButton: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(5)
                  ),
                  color: AppColor.lightGreen
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.chat),
              )),

          bottomNavigationBar: CustomBottomNavBar(),
          body: Center(
            child: Column(
              children: [
                SearchBarWidget(),
                Expanded(
                  child: ListView.builder(
                    itemCount: chatList.length,
                    itemBuilder: (context, index) {
                      return ChatUserTileWidget(
                        chat: chatList[index],
                        onTap: () {
                          
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
