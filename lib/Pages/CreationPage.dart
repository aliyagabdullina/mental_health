import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class CreationPageState extends StatefulWidget {
  CreationPageState({Key? key}) : super(key: key);

  @override
  _CreationPageState createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildCreationPageContainer(),
      ),
    );
  }

  Widget buildCreationPageContainer() {
    return Container();
  }
}
