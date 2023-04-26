import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';
import 'package:Mental_Health/Pages/TimeScreenPage.dart';
import 'package:Mental_Health/Pages/LevelScreenPage.dart';
import 'package:Mental_Health/Pages/DirectionScreenPage.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class StatisticsPageState extends StatefulWidget {
  StatisticsPageState({Key? key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildStatisticsPageContainer(),
      ),
    );
  }

  Widget buildStatisticsPageContainer() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Statistics',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: whiteTextColor,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Total Sessions',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: whiteTextColor,
                    ),
                  ),
                  Text(
                    '10',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: whiteTextColor,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Total Time',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: whiteTextColor,
                    ),
                  ),
                  Text(
                    '5 hours',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: whiteTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}
