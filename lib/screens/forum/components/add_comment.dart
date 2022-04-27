import 'package:cginot_app/animations/transition.dart';
import 'package:cginot_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Post {
  final String detail;
  final String date;
  final String postID;
  final String uid;
  final int likeCount;
  final int dislikeCount;

  Post(this.detail, this.date, this.postID, this.uid, this.likeCount,
      this.dislikeCount);

  Map<String, dynamic> toJson() => {
        'text': detail,
        'date': date,
        'postID': postID,
        'userID': uid,
        'likeCount': likeCount,
        'dislikeCount': dislikeCount,
      };
}

class FirestoreUpload {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String commenttID = const Uuid().v1();

  uploadPost(String detail, User? uid, String postID) {
    Post post = Post(
        detail, DateTime.now().toString(), postID, uid!.uid.toString(), 0, 0);
    _firestore
        .collection('forum')
        .doc(postID)
        .collection('comment')
        .doc(commenttID)
        .set(post.toJson());
  }
}

class AddCommentScreen extends HookWidget {
  final String postID;

  const AddCommentScreen({required this.postID});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final _titleController = useTextEditingController();
    final _detailController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/forum');
          },
          icon: Icon(Icons.home_outlined),
        ),
        title: const Text("Add comment"),
      ),
      backgroundColor: cBackgroundColor,
      body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                  1.2,
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              decoration: const BoxDecoration(),
                              child: TextFormField(
                                controller: _detailController,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 25.75),
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Colors.grey.withOpacity(.8)),
                                    hintText: "Your Comment"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              )),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                print(FirebaseAuth.instance.currentUser!.uid
                                    .toString());
                                print(postID);
                                print(_detailController.text);
                                FirestoreUpload().uploadPost(
                                    _detailController.text.trim(),
                                    FirebaseAuth.instance.currentUser,
                                    postID);
                              }
                              context.go("/detail?postID=${postID}");
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ])),
    );
  }
}
