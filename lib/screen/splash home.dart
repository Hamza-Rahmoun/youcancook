import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:youcancook/provider/meal.dart';
import 'package:youcancook/screen2/tabs_screen.dart';

class SplashHome extends StatefulWidget {
  final List<Meal> meal;
  SplashHome(this.meal);
  @override
  _SplashHomeState createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 4),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => TabsScreen(widget.meal))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple,
                    Colors.black,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                image: DecorationImage(
                  image: AssetImage('assets/papa.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    Color.fromRGBO(55, 24, 65, 1),
                    BlendMode.modulate,
                  ),
                ),
              ),
            ),
            Center(
              child: JumpingText(
                'Loading...',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
