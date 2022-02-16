import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: cBackgroundColor,
          padding: const EdgeInsets.all(23),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Color.fromARGB(169, 249, 250, 251),
        ),
        onPressed: press,
        child: Row(
          children: [
            const SizedBox(width: 5),
            const SizedBox(
              width: 10,
            ),
            Expanded(child: Text(text)),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
