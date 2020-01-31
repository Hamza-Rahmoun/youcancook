import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youcancook/component/BOTTOMBOTTOM.dart';
import 'package:youcancook/component/GENDERcard.dart';
import 'package:youcancook/component/incrementcard.dart';
import 'package:youcancook/component/reusable%20card.dart';
import 'package:youcancook/screen3/resultpage.dart';
import 'package:youcancook/widget2/main_drawer.dart';

import '../calculatorbrain.dart';

const bool debugEnableDeviceSimulator = true;

class InputPage extends StatefulWidget {
  static const routeName = 'inpute page';
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectGender;
  int _height = 120;
  int _weight = 60;
  int _age = 18;

  @override
  Widget build(BuildContext context) {
    final targetDevice = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return SystemNavigator.pop();
      },
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 50),
          child: Scaffold(
            drawer: MainDrawer(),
            appBar: AppBar(
              title: Text('BMI CALCULATOR'),
            ),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (ctx, i) {
                        return Column(
                          children: <Widget>[
                            Container(
                              height: targetDevice.height > 550
                                  ? targetDevice.height * 0.9
                                  : MediaQuery.of(context).size.height * 1.6,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: ReusableCard(
                                            onTap: () {
                                              setState(() {
                                                selectGender = Gender.MALE;
                                              });
                                            },
                                            colour: selectGender == Gender.MALE
                                                ? Color.fromRGBO(
                                                    149, 70, 225, 1)
                                                : Color.fromRGBO(
                                                    149, 70, 225, 0.7),
                                            child: GenderCard(
                                              gender: Gender.MALE,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: ReusableCard(
                                            onTap: () {
                                              setState(() {
                                                selectGender = Gender.FEMALE;
                                              });
                                            },
                                            colour:
                                                selectGender == Gender.FEMALE
                                                    ? Color.fromRGBO(
                                                        149, 70, 225, 1)
                                                    : Color.fromRGBO(
                                                        149, 70, 225, 0.7),
                                            child: GenderCard(
                                              gender: Gender.FEMALE,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: ReusableCard(
                                            colour:
                                                Color.fromRGBO(149, 70, 225, 1),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'HEIGHT',
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.white),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .baseline,
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  children: <Widget>[
                                                    Text(_height.toString(),
                                                        style: TextStyle(
                                                          fontSize: 50.0,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Colors.white,
                                                        )),
                                                    Text(
                                                      'cm',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                                SliderTheme(
                                                  data: SliderTheme.of(context)
                                                      .copyWith(
                                                          thumbShape:
                                                              RoundSliderThumbShape(
                                                                  enabledThumbRadius:
                                                                      12),
                                                          overlayShape:
                                                              RoundSliderOverlayShape(
                                                                  overlayRadius:
                                                                      30),
                                                          thumbColor:
                                                              Color.fromRGBO(
                                                                  52, 0, 106, 1),
                                                          overlayColor:
                                                              Color.fromRGBO(52,
                                                                  0, 106, 0.7),
                                                          activeTrackColor:
                                                              Colors.white,
                                                          inactiveTrackColor:
                                                              Colors.white),
                                                  child: Slider(
                                                    value: _height.toDouble(),
                                                    min: 120,
                                                    max: 220,
                                                    onChanged: (double value) {
                                                      setState(() {
                                                        _height = value.round();
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: ReusableCard(
                                            colour:
                                                Color.fromRGBO(149, 70, 225, 1),
                                            child: IncrementCard(
                                                label: 'WEIGHT',
                                                value: _weight,
                                                onPressMinus: () {
                                                  setState(() {
                                                    if (_weight > 0) _weight--;
                                                  });
                                                },
                                                onPressPlus: () {
                                                  setState(() {
                                                    _weight++;
                                                  });
                                                }),
                                          ),
                                        ),
                                        Expanded(
                                          child: ReusableCard(
                                            colour:
                                                Color.fromRGBO(149, 70, 225, 1),
                                            child: IncrementCard(
                                              label: 'AGE',
                                              value: _age,
                                              onPressMinus: () {
                                                setState(() {
                                                  if (_age > 0) _age--;
                                                });
                                              },
                                              onPressPlus: () {
                                                setState(() {
                                                  _age++;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  BottomButton(
                    buttonTitle: 'CALCULATE',
                    onTap: () {
                      CalculatorBrain calc =
                          CalculatorBrain(height: _height, weight: _weight);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultsPage(),
                              settings: RouteSettings(arguments: calc)));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
