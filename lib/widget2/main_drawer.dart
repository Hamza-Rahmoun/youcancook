import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:youcancook/provider.dart';
import 'package:youcancook/screen2/filters_screen.dart';
import 'package:youcancook/screen3/inputepage.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  InterstitialAd interstitialAd;
  static final MobileAdTargetingInfo targetingInfo = new MobileAdTargetingInfo(
    testDevices: <String>[],
    keywords: <String>['wallpapers', 'walls', 'amoled'],
    birthday: new DateTime.now(),
    childDirected: true,
  );
  InterstitialAd myInterstitial() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.failedToLoad) {
          interstitialAd..load();
        } else if (event == MobileAdEvent.closed) {
          interstitialAd = myInterstitial()..load();
        }
      },
    );
  }

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    interstitialAd = myInterstitial()..load();
    super.initState();
  }

  @override
  void dispose() {
    interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Maradona>(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Cook Planner'),
            backgroundColor: Color.fromRGBO(52, 0, 106, 1),
            automaticallyImplyLeading: false,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant_menu,
              size: 30,
              color: Colors.deepPurple,
            ),
            title: Text(
              'Meal Recipes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1,
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 30,
              color: Colors.deepPurple,
            ),
            title: Text(
              'Filters',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1,
              ),
            ),
            onTap: () {
              interstitialAd..show()..show();
              Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.calculator,
              size: 30,
              color: Colors.deepPurple,
            ),
            title: Text(
              'Calcule',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1,
              ),
            ),
            onTap: () {
              interstitialAd..show()..show();
              Navigator.pushReplacementNamed(context, InputPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
