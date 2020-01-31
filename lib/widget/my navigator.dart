import 'package:flutter/material.dart';
import 'package:youcancook/screen2/tabs_screen.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      TabsScreen.routeName,
    );
  }
}
