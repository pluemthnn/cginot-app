import 'package:cginot_app/constants.dart';
import 'package:cginot_app/screens/forum/components/createPost.dart';
import 'package:cginot_app/screens/forum/components/utils.dart';
import 'package:cginot_app/screens/forum/forum_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Body extends StatefulWidget {
  static String routeName = '/forum';

  final UserProfileData userData;
  final ValueChanged<UserProfileData> updateMyData;
  Body({required this.userData, required this.updateMyData});
  @override
  State<StatefulWidget> createState() => _ForumMain();
}

class _ForumMain extends State<ForumScreen> {
  bool _isLoading = false;

  void _writePost() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WritePost(
                  userData: widget.userData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          // stream: Firestore.instance
          //     .collection('thread')
          //     .orderBy('postTimeStamp', descending: true)
          //     .snapshots(),
          builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return Stack(
          children: <Widget>[
            // snapshot.data.documents.length > 0
            //     ? ListView(
            //         shrinkWrap: true,
            //         children: snapshot.data.documents
            //             .map((DocumentSnapshot data) {
            //           return ThreadItem(
            //             data: data,
            //             myData: widget.myData,
            //             updateMyDataToMain: widget.updateMyData,
            //             threadItemAction: _moveToContentDetail,
            //             isFromThread: true,
            //             commentCount: data['postCommentCount'],
            //             parentContext: context,
            //           );
            //         }).toList(),
            //       )
            //     :
            Container(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.error,
                    color: Colors.grey[700],
                    size: 64,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      'There is no post',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
            ),
            Utils.loadingCircle(_isLoading),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _writePost,
        tooltip: 'Increment',
        child: Icon(Icons.create),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // void _moveToContentDetail(DocumentSnapshot data) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => ContentDetail(
  //                 postData: data,
  //                 userData: widget.userData,
  //                 updateMyData: widget.updateMyData,
  //               )));
  // }
}
