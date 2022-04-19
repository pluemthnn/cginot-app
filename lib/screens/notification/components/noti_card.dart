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
      child: Ink(
        padding: const EdgeInsets.symmetric(
            horizontal: cDefaultPadding, vertical: cDefaultPadding * 1.75),
        color: notification.isRead
            ? cBackgroundColor
            : const Color.fromARGB(52, 207, 216, 220),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  child: const Icon(Icons.reply_sharp, color: Colors.white),
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
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC3DDFD)),
                    ),
                    const SizedBox(height: 15),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        notification.replyMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Color(0xFFC3DDFD)),
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
