import 'package:flutter/material.dart';

Color PanelColor = Color.fromRGBO(17, 17, 16, 0.6);

class BottomPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(187, 187, 187, 0.7),
          Color.fromRGBO(5, 5, 5, 0.7),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        color: PanelColor,
        boxShadow: [
          BoxShadow(
            color: PanelColor,
            blurRadius: 100,
            blurStyle: BlurStyle.solid,
          )
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('assets/Icons/MainIcon.png'),
            Image.asset('assets/Icons/PlusIcon.png'),
            Image.asset('assets/Icons/ProfileIcon.png'),
          ]),
    );
  }
}
