import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';
import 'package:Mental_Health/Pages/TimeScreenPage.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class YogaPageState extends StatefulWidget {
  YogaPageState({Key? key}) : super(key: key);

  @override
  _YogaPageState createState() => _YogaPageState();
}

class _YogaPageState extends State<YogaPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildYogaPageContainer(),
      ),
    );
  }

  Widget buildYogaPageContainer() {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      child: Stack(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              topPanel(),
              yoga(),
            ],
          ),
          if (_showOverlay)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: _hideTimeScreenPage,
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
          if (_showOverlay)
            Positioned(
              top: 125,
              left: 0,
              right: 0,
              bottom: 510,
              child: TimeScreenPageState(),
            ),
          Positioned(
            bottom: 0,
            width: 430,
            height: 92,
            child: BottomPanel(),
          ),
        ],
      ),
    );
  }

  bool _showOverlay = false;

  void _toggleOverlay() {
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }

  Widget customButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: () {
        if (text == "Время") {
          _showTimeScreenPage();
        } else {
          onPressed();
        }
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: whiteTextColor, width: 2.0),
        ),
        minimumSize: MaterialStateProperty.all(Size(0, 56)),
      ),
      child: Text(text, style: TextStyle(fontSize: 16, color: whiteTextColor)),
    );
  }


  Widget topPanel() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: _showTimeScreenPage,
            child: customButton("Время", () {}),
          ),

          customButton("Уровень", () {}),
          customButton("Направление", () {}),
        ],
      ),
    );
  }

  void _showTimeScreenPage() {
    setState(() {
      _showOverlay = true;
    });
  }

  void _hideTimeScreenPage() {
    setState(() {
      _showOverlay = false;
    });
  }


  Widget oneYoga() {
    return SizedBox(
      width: 350,
      height: 210,
      child: Image.asset(
        'assets/Images/News.png',
        width: 350,
        height: 210,
      ),
    );
  }

  Widget yoga() {
    return Column(
      children: <Widget>[
        oneYoga(),
        SizedBox(height: 25),
        oneYoga(),
        SizedBox(height: 25),
        oneYoga(),
        SizedBox(height: 25),
        oneYoga(),
        SizedBox(height: 25),
        oneYoga(),
        SizedBox(height: 25),
        oneYoga(),
        SizedBox(height: 25),
        oneYoga(),
        SizedBox(height: 25),
      ],
    );
  }
}
