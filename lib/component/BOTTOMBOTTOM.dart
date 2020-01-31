import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  const BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    final tagetDevice = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
        )),
        color: Color.fromRGBO(52, 0, 106, 1),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: tagetDevice > 550 ? tagetDevice * 0.07 : tagetDevice * 0.15,
      ),
    );
  }
}
