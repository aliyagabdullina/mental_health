import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showOverlay = false;

  void _toggleOverlay() {
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }

  Widget customButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: Colors.black, width: 2.0),
        ),
        minimumSize: MaterialStateProperty.all(Size(0, 56)),
      ),
      child: Text(text, style: TextStyle(fontSize: 16, color: Colors.black)),
    );
  }

  Widget topPanel() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: _toggleOverlay,
            child: customButton("Время", () {}),
          ),
          customButton("Уровень", () {}),
          customButton("Направление", () {}),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My App')),
      body: Stack(
        children: [
          // Main content
          Center(
            child: topPanel(),
          ),
          // Overlay
          if (_showOverlay)
            Container(
              color: Colors.white.withOpacity(0.8),
              child: Center(
                child: Text('Time'),
              ),
            ),
        ],
      ),
    );
  }
}
