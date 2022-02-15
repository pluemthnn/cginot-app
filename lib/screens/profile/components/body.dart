import 'package:flutter/material.dart';

import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProfilePic(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
