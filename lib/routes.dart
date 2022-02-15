import 'package:cginot_app/screens/onboard/onboard_screen.dart';
import 'package:cginot_app/screens/profile/profile_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  OnboardScreen.routeName: (context) => OnboardScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
