import 'package:cginot_app/animations/transition.dart';
import 'package:cginot_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../models/buttom_bar.dart';

class Post {
  final String title;
  final String detail;
  final date;

  Post(this.title, this.detail, this.date);

  Map<String, dynamic> toJson() =>
      {'title': title, 'description': detail, 'date': date};
}

class FirestoreUpload {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String PostID = const Uuid().v1();

  uploadPost(String title, String detail) {
    Post post = Post(title, detail, DateTime.now());
    _firestore.collection('forum').doc(PostID).set(post.toJson());
  }
}

class ForumCreateScreen extends HookWidget {
  const ForumCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final _titleController = useTextEditingController();
    final _detailController = useTextEditingController();

    return Scaffold(
      backgroundColor: cBackgroundColor,
      body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                    1,
                    const Text(
                      "Create post",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
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
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade300))),
                            child: TextFormField(
                              controller: _titleController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.grey.withOpacity(.8)),
                                  hintText: "Title"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
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
                                    hintText: "Detail"),
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
                                print(_titleController.text);
                                print(_detailController.text);
                                FirestoreUpload().uploadPost(
                                    _titleController.text.trim(),
                                    _detailController.text.trim());
                              }
                              context.go('/forum');
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ])),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
