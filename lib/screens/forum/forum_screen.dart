import 'package:cginot_app/constants.dart';
import 'package:cginot_app/models/buttom_bar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({Key? key}) : super(key: key);

  get userData => null;

  @override
  _ForumScreenState createState() => _ForumScreenState();
  static String routeName = '/forum';
}

class _ForumScreenState extends State<ForumScreen> {
  // int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(
        updateMyData: (UserProfileData value) {},
        userData: MockUserData,
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
