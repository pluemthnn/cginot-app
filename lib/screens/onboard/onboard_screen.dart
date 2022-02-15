import 'package:cginot_app/screens/onboard/components/body.dart';
import 'package:cginot_app/size_config.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
