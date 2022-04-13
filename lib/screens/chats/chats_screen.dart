import 'package:cginot_app/constants.dart';
import 'package:cginot_app/models/buttom_bar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
  static String routeName = '/chats';
}

class _ChatsScreenState extends State<ChatsScreen> {
  // int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: cNavColor,
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
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
      title: const Text("Chats"),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/profile');
          },
        ),
      ],
    );
  }
}
