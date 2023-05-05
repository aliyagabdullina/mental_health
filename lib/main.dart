import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/MainPage.dart';
import 'package:Mental_Health/Pages/SettingsPage.dart';
import 'package:Mental_Health/Pages/Panel.dart';
import 'package:Mental_Health/Pages/YogaPage.dart';
import 'package:Mental_Health/Pages/ProfilePage.dart';
import 'package:Mental_Health/Pages/NewsPage.dart';
import 'package:Mental_Health/Pages/PlusPage.dart';
import 'package:Mental_Health/Pages/MoodPage.dart';
import 'package:Mental_Health/Pages/VideoPage.dart';
import 'package:Mental_Health/Youtube/HttpGet.dart';

import 'package:Mental_Health/Pages/NoticePage.dart';

import 'package:Mental_Health/Youtube/YoutubePlayer.dart';

import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Map<String, dynamic>>> fetchData() async {
  final response = await http.get(Uri.parse('http://localhost:8080/videos'));
  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed;
  } else {
    throw Exception('Failed to fetch data');
  }
}

void main() async {
  getInfo();
  runApp(MyApp());
}

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        backgroundColor: Colors.blueAccent,
      ),
      home: VideoPlayerWidget(
        videoUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    );
  }
}
