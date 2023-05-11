import 'dart:convert';
import 'package:flutter/material.dart';

import '../Statistics/CustomPaintWidget.dart';
import 'Panel.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class StatisticsPageState extends StatefulWidget {
  StatisticsPageState({Key? key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPageState> {
  late List<Map<String, dynamic>> _dataList;

  @override
  void initState() {
    super.initState();
    // Здесь мы парсим JSON строку и получаем List<Map<String, dynamic>>
    String jsonString =
        '[{"percentage":50.0,"name":"Йога","count":5},{"percentage":20.0,"name":"Медитация","count":2},{"percentage":10.0,"name":"Благодарность","count":1},{"percentage":0.0,"name":"Здоровый сон","count":0},{"percentage":60.0,"name":"Хобби","count":6},{"percentage":70.0,"name":"Уход","count":7}]';
    _dataList = List<Map<String, dynamic>>.from(json.decode(jsonString));
  }

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
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'Статистика',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: whiteTextColor,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Общее количество заметок: ${_getTotalCount()}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: whiteTextColor,
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        buildStatisticsRow(_dataList[index]),
                        SizedBox(height: 16.0),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          width: 430,
          height: 92,
          child: BottomPanel(),
        )
      ],
    );
  }


  Widget buildStatisticsRow(Map<String, dynamic> data) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black38,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data['name'] + ' ',
                style: TextStyle(
                  fontSize: 24.0,
                  color: whiteTextColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              Text(
                'Вы занимались ${data['count']} раз',
                style: TextStyle(
                  fontSize: 16.0,
                  color: whiteTextColor,
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPaintWidget(
                percentage: data['percentage'] / 100,
              ),
            ],
          ),
        ],
      ),
    );
  }

  int _getTotalCount() {
    return 10;
  }
}
