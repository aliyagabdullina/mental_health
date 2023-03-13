import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';
import 'package:Mental_Health/Pages/YogaPage.dart';
import 'package:Mental_Health/Pages/MeditationPage.dart';
import 'package:Mental_Health/Pages/CreationPage.dart';
import 'package:Mental_Health/Pages/TrainingPage.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class MainPageState extends StatefulWidget {
  MainPageState({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

void navigateToPage(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}

class oneClass extends StatelessWidget {
  final Image image;
  final Widget page;

  const oneClass({Key? key, required this.image, required this.page})
      : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToPage(context, page),
      // add this onTap property
      child: Container(width: 253.0, height: 253.0, child: image),
    );
  }
}

class _MainPageState extends State<MainPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildMainPageContainer(),
      ),
    );
  }

  Widget buildMainPageContainer() {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      child: Stack(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              classes(),
              SizedBox(height: 30),
              dailyOffer(),
              SizedBox(height: 30),
              news(),
            ],
          ),
          Positioned(
            bottom: 0,
            width: 430,
            height: 92,
            child: BottomPanel(),
          )
        ],
      ),
    );
  }

  Widget classes() {
    return Column(
      children: <Widget>[
        Text("Занятия для тебя", textAlign: TextAlign.left),
        SizedBox(height: 20),
        classesScroll(),
      ],
    );
  }

  Widget classesScroll() {
    return Container(
      height: 253,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            oneClass(
              image: Image.asset('assets/Images/Yoga.png'),
              page: YogaPageState(),
            ),
            SizedBox(
              width: 25,
            ),
            oneClass(
              image: Image.asset('assets/Images/Meditation.png'),
              page: MeditationPageState(),
            ),
            SizedBox(
              width: 25,
            ),
            oneClass(
              image: Image.asset('assets/Images/Training.png'),
              page: TrainingPageState(),
            ),
            SizedBox(
              width: 25,
            ),
            oneClass(
              image: Image.asset('assets/Images/Creation.png'),
              page: CreationPageState(),
            ),
          ],
        ),
      ),
    );
  }

  Widget dailyOffer() {
    return Column(
      children: <Widget>[
        Text('Предложения дня'),
        SizedBox(height: 20),
        SizedBox(
          width: 350,
          height: 210,
          child: Image.asset(
            'assets/Images/DayOffer.png',
            width: 350,
            height: 210,
          ),
        ),
      ],
    );
  }

  Widget oneNews() {
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

  Widget news() {
    return Column(
      children: <Widget>[
        Text('Новости'),
        SizedBox(height: 20),
        oneNews(),
        SizedBox(height: 10),
        oneNews(),
        SizedBox(height: 40),
      ],
    );
  }
}
