import 'package:flutter/material.dart';
import 'package:youcancook/component/BOTTOMBOTTOM.dart';
import 'package:youcancook/component/reusable%20card.dart';

import '../calculatorbrain.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tagetDevice = MediaQuery.of(context).size.width;
    final CalculatorBrain calculator =
        ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(bottom: 50),
        child: Scaffold(
          appBar: AppBar(
            title: Text('BMI CALCULATOR'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Your Result',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(52, 0, 106, 1),
                        ),
                      ),
                    ),
                    Container(
                      height: tagetDevice > 400
                          ? MediaQuery.of(context).size.height * 0.8
                          : MediaQuery.of(context).size.height * 0.9,
                      child: ReusableCard(
                        colour: Color.fromRGBO(52, 0, 106, 0.7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              calculator.getResult().toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              calculator.calculateBMI(),
                              style: TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              calculator.getInterpretation(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                buttonTitle: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
