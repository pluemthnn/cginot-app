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
          height: 100,
        ),
        ProfilePic(),
        const SizedBox(
          height: 50,
        ),
        ProfileMenu(
          text: "My Topic",
          icon: Icons.arrow_forward_ios_sharp,
          press: () => {Navigator.pushReplacementNamed(context, '/chats')},
        ),
        ProfileMenu(
          text: "Favourite",
          icon: Icons.arrow_forward_ios_sharp,
          press: () => {Navigator.pushReplacementNamed(context, '/splash')},
        ),
        ProfileMenu(
          text: "Settings",
          icon: Icons.arrow_forward_ios_sharp,
          press: () => {Navigator.pushReplacementNamed(context, '/splash')},
        ),
        ProfileMenu(
          text: "Switch Profile",
          icon: Icons.arrow_forward_ios_sharp,
          press: () => {Navigator.pushReplacementNamed(context, '/splash')},
        ),
      ],
    );
  }
}
