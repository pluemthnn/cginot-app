import 'package:cginot_app/screens/notification/components/noti_card.dart';
import 'package:flutter/material.dart';

import '../../../models/notification.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: notificationData.length,
            itemBuilder: (context, index) =>
                NotiCard(notification: notificationData[index], press: () => {}
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => MessagesScreen(),
                    //   ),
                    // ),
                    ),
          ),
        ),
      ],
    );
  }
}
