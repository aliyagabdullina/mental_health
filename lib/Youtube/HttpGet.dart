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

void getInfo() async{
  try {
    List<Map<String, dynamic>> parsedJson = await fetchData();

    // Вывод полученных данных в консоль
    for (var data in parsedJson) {
      print(data);
    }
  } catch (error) {
    print('Failed to fetch data: $error');
  }
}