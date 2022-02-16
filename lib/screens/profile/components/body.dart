import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        ProfilePic(),
        const SizedBox(
          height: 50,
        ),
        ProfileMenu(
          text: "Account",
          icon: Icons.account_circle,
          press: () => {Navigator.pushReplacementNamed(context, '/splash')},
        ),
        ProfileMenu(
          text: "Notifications",
          icon: Icons.notifications,
          press: () => {Navigator.pushReplacementNamed(context, '/splash')},
        ),
        ProfileMenu(
          text: "Settings",
          icon: Icons.settings,
          press: () => {Navigator.pushReplacementNamed(context, '/splash')},
        ),
        ProfileMenu(
          text: "Help Center",
          icon: Icons.help_rounded,
          press: () => {Navigator.pushReplacementNamed(context, '/splash')},
        ),
        ProfileMenu(
          text: "Log Out",
          icon: Icons.logout,
          press: () => {Navigator.pushReplacementNamed(context, '/splash')},
        ),
      ],
    );
  }
}
