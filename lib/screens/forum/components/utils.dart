import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

class Utils {
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(Random().nextInt(chars.length))));

  static Widget loadingCircle(bool isLoading) {
    return isLoading ? Positioned(
      child: Container(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        color: Colors.white.withOpacity(0.7),
      ),
    ) : Container();
  }
}
