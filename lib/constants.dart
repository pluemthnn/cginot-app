import 'package:flutter/material.dart';

// styling
const cBackgroundColor = Color(0xFF252F3F);
const cPrimaryColor = Color.fromARGB(255, 189, 181, 178);
const cPrimaryLightColor = Color(0xFFFFECDF);
const cPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color.fromARGB(255, 62, 178, 255), Color.fromARGB(255, 36, 74, 243)],
);
const cSecondaryColor = Color(0xFF979797);
const cTextColor = Color(0xFF757575);
const cDefaultPadding = 20.0;

const cAnimationDuration = Duration(milliseconds: 200);

const TextStyle cHeadingBar =
    TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);

const cWhite = Color(0xFFFFFFFF);
const cLightGray = Color(0xFF8F949D);
const cGray = Color(0xFF4F5865);
const cDarkGray = Color(0xFF252F3F);
const cNavColor = Color(0xFF161E2E);

// data type

class UserProfileData {
  String Thumbnail, Name;
  int LikeList, CommnetList;
  // List<String> LikeList, CommnetList;
  String Token;

  UserProfileData(
      {this.Name = "",
       this.Thumbnail = "",
       this.LikeList = 0,
       this.CommnetList = 0,
       this.Token = ''});
}

var MockUserData = UserProfileData(
  Thumbnail: "",
  Name: "Annonymous",
  LikeList: 15, 
  CommnetList: 2,
  Token: "a83373a8-2d58-11ea-978f-2e728ce88125",
);