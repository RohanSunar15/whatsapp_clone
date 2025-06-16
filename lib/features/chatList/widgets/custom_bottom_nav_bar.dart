import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/theme/app_color.dart';
import 'package:whatsapp_clone/features/chatList/presentation/bloc/custom_bottom_nav_bar_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  final List<_NavItem> _navItems = const [
    _NavItem(icon: Icons.chat, label: 'Chats'),
    _NavItem(icon: Icons.update, label: 'Updates'),
    _NavItem(icon: Icons.groups_outlined, label: 'Communities'),
    _NavItem(icon: Icons.call_outlined, label: 'Calls'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomBottomNavBarCubit, int>(
      builder: (context, selectedIndex) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.lightGrey,
                offset: const Offset(0, -0.5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_navItems.length, (index) {
              final item = _navItems[index];
              final isSelected = index == selectedIndex;

              return GestureDetector(
                onTap: () {
                  context.read<CustomBottomNavBarCubit>().updateIndex(index);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? Colors.lightGreen.shade100
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        item.icon,
                        color:
                            isSelected ? Colors.green.shade800 : Colors.black,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}
