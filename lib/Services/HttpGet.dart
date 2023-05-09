
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import '../Youtube/Video.dart';

List<Map<String, dynamic>> parsedJson = [];

Future<List<Map<String, dynamic>>> fetchData() async {
  final response = await http.get(Uri.parse('http://localhost:8080/videos'));
  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed;
  } else {
    throw Exception('Failed to fetch data');
  }
}

void getInfo() async {
  try {
    parsedJson = await fetchData();

    // Запись полученных данных в файл json
    final file = File("/Users/aliya/StudioProjects/mental_health_new/videos.json");
    await file.writeAsString(jsonEncode(parsedJson));

    print('Data saved to video list');
  } catch (error) {
    print('Failed to fetch data: $error');
  }
}

List<Video> getVideos(){

  return videoListFromJson(parsedJson);
}

List<Video> videoListFromJson(List<Map<String, dynamic>> parsedJson) {
  List<Video> videos = [];
  int index = 0;
  for (Map<String, dynamic> videoJson in parsedJson) {
    Video video = Video.fromJson(videoJson, index);
    index++;
    videos.add(video);
  }
  return videos;
}
