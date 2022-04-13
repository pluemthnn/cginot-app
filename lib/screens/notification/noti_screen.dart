import 'package:cginot_app/models/buttom_bar.dart';
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
      bottomNavigationBar: const BottomBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      shape: const Border(
          bottom: BorderSide(
        color: Colors.grey,
        width: 1,
      )),
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
