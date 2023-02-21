import 'package:flutter/material.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class MainPageState extends StatefulWidget {
  MainPageState({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          width: 350,
          //color: backgroundColor,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Text('Занятия для тебя'),
              SizedBox(height: 20),
              SizedBox(
                width: 253,
                height: 253,
                child: Placeholder(),
              ),
              SizedBox(height: 30),
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
              SizedBox(height: 30),
              Text('Новости'),
              SizedBox(height: 20),
              SizedBox(
                width: 350,
                height: 210,
                child: Image.asset(
                  'assets/Images/News.png',
                  width: 350,
                  height: 210,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 350,
                height: 210,
                child:Image.asset(
                  'assets/Images/News.png',
                  width: 350,
                  height: 210,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
