import 'package:cginot_app/animations/transition.dart';
import 'package:cginot_app/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
  static String routeName = '/login';
}

class _LoginScreenState extends State<LoginScreen> {
  late final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passController = TextEditingController();

  Future firebaseLogin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    if (kDebugMode) {
      print(email + ' ' + password);
    }
    late bool isLogin = true;
    print(isLogin);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (_) {
      if (kDebugMode) {
        print(isLogin);
      }
      isLogin = false;
    }
    if (kDebugMode) {
      print(isLogin);
    }

    if (isLogin == false) {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        isLogin = true;
      } on FirebaseAuthException catch (e2) {
        if (kDebugMode) {
          print(e2);
        }
        if (e2 != null) {
          isLogin = false;
        }
      }
    }

    print(isLogin);
    if (isLogin == true) {
      context.go('/forum');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackgroundColor,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(
                1.2,
                const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 30,
            ),
            FadeAnimation(
                1.5,
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300))),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            controller: emailController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(.8)),
                                hintText: "Email"),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            controller: passController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.grey.withOpacity(.8)),
                                hintText: "Password"),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(
              height: 40,
            ),
            FadeAnimation(
                1.8,
                Center(
                  child: Container(
                    width: 120,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.blue[800]),
                    child: Center(
                        child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                firebaseLogin(
                                    email: emailController.text.trim(),
                                    password: passController.text.trim(),
                                    context: context);
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.7)),
                            ))),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
