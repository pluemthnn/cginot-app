import 'package:cginot_app/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final Function() onPressed;
  final IconData bottomIcons;
  final String text;
  final bool isOnSelect;

  const NavItem({
    Key? key,
    required this.onPressed,
    required this.bottomIcons,
    required this.text,
    required this.isOnSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: isOnSelect ? const Color(0xFFC3DDFD) : Colors.white,
      ),
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(bottomIcons),
          const SizedBox(height: 3),
          Text(text),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentRoute = GoRouter.of(context).location;

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      height: 70,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: cNavColor,
          border: Border(
              top: BorderSide(
            color: Colors.grey,
            width: 1,
          ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavItem(
            onPressed: () => context.go('/notifications'),
            bottomIcons: Icons.notifications,
            text: 'Notification',
            isOnSelect: currentRoute == '/notifications',
          ),
          NavItem(
            onPressed: () => context.go('/chats'),
            bottomIcons: Icons.chat,
            text: 'Chats',
            isOnSelect: currentRoute == '/chats',
          ),
          NavItem(
            onPressed: () => context.go('/profile'),
            bottomIcons: Icons.person,
            text: 'Profile',
            isOnSelect: currentRoute == '/profile',
          ),
        ],
      ),
    );
  }
}
