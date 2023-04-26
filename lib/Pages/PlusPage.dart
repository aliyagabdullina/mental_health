import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class PlusPageState extends StatefulWidget {
  PlusPageState({Key? key}) : super(key: key);

  @override
  _PlusPageState createState() => _PlusPageState();
}

class _PlusPageState extends State<PlusPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildPlusPageContainer(),
      ),
    );
  }

  Widget buildPlusPageContainer() {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 20,
          left: 20,
          child: ElevatedButton(
            onPressed: () {
              // Действие, которое будет выполняться при нажатии на кнопку
            },
            child: Text("Кнопка 1"),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              // Действие, которое будет выполняться при нажатии на кнопку
            },
            child: Text("Кнопка 2"),
          ),
        ),
        Positioned(
          left: 150,
          bottom: 100,
          child: ElevatedButton(
            onPressed: () {
              // Действие, которое будет выполняться при нажатии на кнопку
            },
            child: Text("Кнопка 3"),
          ),
        ),
      ],
    );
  }
}
