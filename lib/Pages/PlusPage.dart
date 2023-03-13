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
    return Container(
      //Писать здесь. Может быть вместо контейнера что-то другое
    );
  }
}
