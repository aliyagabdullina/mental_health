import 'dart:io';

import 'package:flutter/material.dart';

class Notion {

  String emoji;
  String date;
  String noteText;
  List<String> activityTextsList;

  Notion(
      {required this.emoji,
        required this.date,
        required this.noteText,
        required this.activityTextsList,
        });

  factory Notion.fromJson(Map<String, dynamic> json, int index) {
      return Notion(
        emoji: json['image'],
        date: json['date'],
        noteText: json['noteText'],
        activityTextsList: json['activityTexts'],
        );

  }
  String getEmoji(){
    return emoji;
  }
  String getDate(){
    return date;
  }
  String getText(){
    return noteText;
  }
  List<String> getActivityTextsList(){
    return activityTextsList;
  }

}
