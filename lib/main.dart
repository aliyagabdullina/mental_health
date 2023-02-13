import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        backgroundColor: Colors.blueAccent,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main page'),
      ),
      body: ListView(
        children: [
          Text('This is Main page!'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPageState()));
            },
            child: Text('Go to Settings'),
          ),
        ],
      ),
    );
  }
}

class SettingsPageState extends StatefulWidget {
  SettingsPageState({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPageState> {
  @override
  bool _isActive = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Включить уведомления'),
            trailing: GestureDetector(
              onTap: () {
                setState(() {
                  _isActive = !_isActive;
                });
              },
              child: Switch(
                value: _isActive,
                onChanged: (bool value) {
                  setState(() {
                    _isActive = !_isActive;
                  });
                },
              ),
            ),
          ),
          ListTile(
            title: Text('Рассказать друзьям'),
          ),
          ListTile(
            title: Text('Условия пользования'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Политика конфиденциальности'),
          ),
          ListTile(
            title: Text('Служба поддержки'),
          ),
        ],
      ),
    );
  }
}
