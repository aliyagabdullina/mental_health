import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';
import 'package:Mental_Health/Pages/TimeScreenPage.dart';
import 'package:Mental_Health/Pages/LevelScreenPage.dart';
import 'package:Mental_Health/Pages/DirectionScreenPage.dart';
import 'package:Mental_Health/Pages/VideoPage.dart';

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
          if (_showOverlayTime)
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
          if (_showOverlayTime)
            Positioned(
              top: 135,
              left: 0,
              right: 0,
              bottom: 510,
              child: TimeScreenPageState(),
            ),
          if (_showOverlayLevel)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: _hideLevelScreenPage,
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
          if (_showOverlayLevel)
            Positioned(
              top: 135,
              left: 0,
              right: 0,
              bottom: 560,
              child: LevelScreenPageState(),
            ),
          if (_showOverlayDirection)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: _hideDirectionScreenPage,
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
          if (_showOverlayDirection)
            Positioned(
              top: 135,
              left: 0,
              right: 0,
              bottom: 390,
              child: DirectionScreenPageState(),
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

  bool _showOverlayTime = false;
  bool _showOverlayLevel = false;
  bool _showOverlayDirection = false;

  Widget customButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: () {
        if (text == "Время") {
          _showTimeScreenPage();
        } else {
          if (text == "Уровень") {
            _showLevelScreenPage();
          } else {
            if (text == "Направление") {
              _showDirectionScreenPage();
            }
          }
        }
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: whiteTextColor, width: 1.0),
        ),
        minimumSize: MaterialStateProperty.all(Size(0, 56)),
      ),
      child: Text(text, style: TextStyle(fontSize: 16, color: whiteTextColor)),
    );
  }

  Widget topPanel() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: _showTimeScreenPage,
            child: customButton("Время", () {}),
          ),
          GestureDetector(
            onTap: _showLevelScreenPage,
            child: customButton("Уровень", () {}),
          ),
          GestureDetector(
            onTap: _showLevelScreenPage,
            child: customButton("Направление", () {}),
          ),
        ],
      ),
    );
  }

  void _showTimeScreenPage() {
    setState(() {
      _showOverlayTime = true;
    });
  }

  void _hideTimeScreenPage() {
    setState(() {
      _showOverlayTime = false;
    });
  }

  void _showLevelScreenPage() {
    setState(() {
      _showOverlayLevel = true;
    });
  }

  void _hideLevelScreenPage() {
    setState(() {
      _showOverlayLevel = false;
    });
  }

  void _showDirectionScreenPage() {
    setState(() {
      _showOverlayDirection = true;
    });
  }

  void _hideDirectionScreenPage() {
    setState(() {
      _showOverlayDirection = false;
    });
  }


  Widget yoga() {
    return Column(
      children: <Widget>[
        oneVideos(
          image: Image.asset('assets/Images/Yoga1.jpg',
              width: 380, height: 210, fit: BoxFit.cover),
          text: "Хатха йога",
          text1: "Новичок ",
          text2: "10 мин",
        ),
        SizedBox(height: 20),
        oneVideos(
          image: Image.asset('assets/Images/Yoga7.jpg',
              width: 380, height: 210, fit: BoxFit.cover),
          text: "Оздоровительная йога",
          text1: "Продолжающий ",
          text2: "20 мин",
        ),
        SizedBox(height: 20),
        oneVideos(
          image: Image.asset('assets/Images/DayOffer2.jpg',
              width: 380, height: 210, fit: BoxFit.cover),
          text: "Йога нидра",
          text1: "Средний ",
          text2: "15 мин",
        ),
        SizedBox(height: 20),
        oneVideos(
          image: Image.asset('assets/Images/News1.jpg',
              width: 380, height: 210, fit: BoxFit.cover),
          text: "Фитнес йога",
          text1: "Средний ",
          text2: "25 мин",
        ),
        SizedBox(height: 20),
        oneVideos(
          image: Image.asset('assets/Images/Yoga3.jpg',
              width: 380, height: 210, fit: BoxFit.cover),
          text: "Стретчинг йога",
          text1: "Продолжающий ",
          text2: "40 мин",
        ),
        SizedBox(height: 20),
        oneVideos(
          image: Image.asset('assets/Images/Yoga10.jpg',
              width: 380, height: 210, fit: BoxFit.cover),
          text: "Шивананда йога",
          text1: "Продолжающий ",
          text2: "35 мин",
        ),
        SizedBox(height: 58),
      ],
    );
  }
}

class oneVideos extends StatelessWidget {
  final Image image;
  final String text;
  final String text1;
  final String text2;

  const oneVideos({
    super.key,
    required this.image,
    required this.text,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VideoPageState()),
        );
      },
      child: Container(
        width: 380,
        height: 210,
        child: Stack(
          children: [
            Container(
              child: image,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(text,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w400)),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(text1,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                    Text(text2,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/Icons/Video.png'),
            )
          ],
        ),
      ),
    );
  }
}
