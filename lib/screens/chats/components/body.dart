import 'package:cginot_app/models/chat.dart';
// import 'package:cginot_app/components/filled_outline_button.dart';
// import 'package:cginot_app/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'chat_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   padding: const EdgeInsets.fromLTRB(
        //       cDefaultPadding, 0, cDefaultPadding, cDefaultPadding),
        //   color: cPrimaryColor,
        //   child: Row(
        //     children: const [
        // FillOutlineButton(press: () {}, text: "Recent Message"),
        // SizedBox(width: cDefaultPadding),
        // FillOutlineButton(
        //   press: () {},
        //   text: "Active",
        //   isFilled: false,
        // ),
        //     ],
        //   ),
        // ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) =>
                ChatCard(chat: chatsData[index], press: () => {}
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
