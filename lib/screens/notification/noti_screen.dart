import 'package:flutter/material.dart';

import 'components/body.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
  static String routeName = '/notifications';
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      // bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    // var _selectedIndex;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // currentIndex: _selectedIndex,
      // onTap: (value) {
      //   setState(() {
      //     _selectedIndex = value;
      //   });
      // },
      items: [
        const BottomNavigationBarItem(
            icon: Icon(Icons.messenger), label: "Chats"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.people), label: "People"),
        const BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        const BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          label: "Profile",
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("Notification"),
      actions: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/profile');
          },
        ),
      ],
    );
  }
}
