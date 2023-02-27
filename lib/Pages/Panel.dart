import 'package:flutter/material.dart';

Color PanelColor = Color.fromRGBO(17, 17, 16, 0.7);

class BottomPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: PanelColor,
        boxShadow: [
          BoxShadow(
              color: PanelColor,
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0.0, 1.0))
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
