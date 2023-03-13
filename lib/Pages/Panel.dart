import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/MainPage.dart';
import 'package:Mental_Health/Pages/PlusPage.dart';
import 'package:Mental_Health/Pages/ProfilePage.dart';

Color PanelColor = Color.fromRGBO(17, 17, 16, 0.6);

class BottomPanel extends StatelessWidget {
  void navigateToMainPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                MainPageState())); // replace MainPageState with your desired state
  }

  void navigateToPlusPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                PlusPageState())); // replace MainPageState with your desired state
  }

  void navigateToProfilePage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                ProfilePageState())); // replace MainPageState with your desired state
  }

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
            GestureDetector(
              onTap: () => navigateToMainPage(context),
              // add this onTap property
              child: Image.asset('assets/Icons/MainIcon.png'),
            ),
            GestureDetector(
              onTap: () => navigateToPlusPage(context),
              // add this onTap property
              child: Image.asset('assets/Icons/PlusIcon.png'),
            ),
            GestureDetector(
              onTap: () => navigateToProfilePage(context),
              // add this onTap property
              child: Image.asset('assets/Icons/ProfileIcon.png'),
            ),
          ]),
    );
  }
}
