import 'package:cginot_app/constants.dart';
import 'package:cginot_app/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final Map<int, Color> _colorMap = {
  50: const Color(0xffce5641), //10%
  100: const Color(0xffb74c3a), //20%
  200: const Color(0xffa04332), //30%
  300: const Color(0xff89392b), //40%
  400: const Color(0xff733024), //50%
  500: const Color(0xff5c261d), //60%
  600: const Color(0xff451c16), //70%
  700: const Color(0xff2e130e), //80%
  800: const Color(0xff170907), //90%
  900: const Color(0xff000000), //100%
};

final MaterialColor _colorSwatch = MaterialColor(cNavColor.value, _colorMap);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'cginot',
      theme: ThemeData(
        scaffoldBackgroundColor: cBackgroundColor,
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: cTextColor),
            bodyText2: TextStyle(color: cTextColor)),
        primarySwatch: _colorSwatch,
        // primaryColor: cBarColor,
      ),
      routeInformationParser: routes.routeInformationParser,
      routerDelegate: routes.routerDelegate,
    );
  }
}
