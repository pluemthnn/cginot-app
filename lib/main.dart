import 'package:cginot_app/constants.dart';
import 'package:cginot_app/routes.dart';
// import 'package:cginot_app/screens/onboard/onboard_screen.dart';
import 'package:cginot_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'cginot',
      theme: ThemeData(
        scaffoldBackgroundColor: cBackgroundColor,
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: cTextColor),
            bodyText2: TextStyle(color: cTextColor)),
        primarySwatch: Colors.blue,
      ),
      initialRoute: ProfileScreen.routeName,
      routes: routes,
      // home: OnboardScreen(),
    );
  }
}
