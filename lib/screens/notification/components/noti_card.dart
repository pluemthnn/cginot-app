import 'package:cginot_app/models/notification.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class NotiCard extends StatelessWidget {
  const NotiCard({
    Key? key,
    required this.notification,
    required this.press,
  }) : super(key: key);

  final Notifications notification;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: cDefaultPadding, vertical: cDefaultPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  child: Icon(Icons.reply_sharp, color: Colors.white),
                  radius: 24,
                  backgroundColor: Colors.blueGrey[400],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: cDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.titleMessage,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC3DDFD)),
                    ),
                    SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        notification.replyMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Color(0xFFC3DDFD)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text(notification.time),
            ),
          ],
        ),
      ),
    );
  }
}
