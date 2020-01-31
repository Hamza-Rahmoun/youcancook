import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youcancook/component/roundediconbottom.dart';

class IncrementCard extends StatelessWidget {
  final String label;
  final int value;
  final Function onPressMinus;
  final Function onPressPlus;

  IncrementCard(
      {@required this.label,
      @required this.value,
      @required this.onPressMinus,
      @required this.onPressPlus});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(label, style: TextStyle(fontSize: 18.0, color: Colors.white)),
        Text(value.toString(),
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: onPressMinus,
            ),
            SizedBox(
              width: 10,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: onPressPlus,
            ),
          ],
        )
      ],
    );
  }
}
