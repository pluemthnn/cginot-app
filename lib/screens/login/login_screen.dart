import 'package:cginot_app/animations/transition.dart';
import 'package:cginot_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
  static String routeName = '/login';
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackgroundColor,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(
                1.2,
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 30,
            ),
            FadeAnimation(
                1.5,
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey.shade300))),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.grey.withOpacity(.8)),
                              hintText: "Email or Phone number"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.grey.withOpacity(.8)),
                              hintText: "Password"),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            FadeAnimation(
                1.8,
                Center(
                  child: Container(
                    width: 150,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.blue[800]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(),
                          child: TextButton(
                              onPressed: () => context.go('/'),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.7)),
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: TextButton(
                              onPressed: () => context.go('/'),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.7)),
                              )),
                        ),
                      ],
                    ),
                  ),
                )),
            FadeAnimation(
                1.8,
                Center(
                  child: TextButton(
                      onPressed: () => context.go('/'),
                      child: Text(
                        "Guest login",
                        style: TextStyle(color: Colors.white.withOpacity(.7)),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
