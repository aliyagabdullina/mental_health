import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:Mental_Health/Pages/Panel.dart';
import 'package:Mental_Health/Pages/StatisticsPage.dart';

import 'package:http/http.dart' as http;

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);
Color buttonColor = Color(0xFFB6B6B6);
Color profileColor = Color.fromRGBO(0, 0, 0, 0.4);

class ProfilePageState extends StatefulWidget {
  ProfilePageState({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePageState> {
  late TextEditingController _nameController;
  String _name = "";
  List<String> _rectangles = [
    'Rectangle 1',
    'Rectangle 2',
    'Rectangle 3',
    'Rectangle 4',
    'Rectangle 5',
    'Rectangle 6',
    'Rectangle 7',
    'Rectangle 8',
    'Rectangle 9',
    'Rectangle 10'
  ];

  Future<http.Response> createUser(String? name, String? photo) async {
    final request = http.MultipartRequest(
        'POST', Uri.parse('http://localhost:8081/users'));
    request.fields['name'] = name!;
    var pic = await http.MultipartFile.fromPath('photo', photo!);
    request.files.add(pic);
    final response = await request.send();
    return http.Response.fromStream(response);
  }

  Widget avatarImage() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Choose an image'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text('Gallery'),
                      onTap: () {
                        Navigator.of(context).pop();
                        _getImageFromGallery();
                      },
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      child: Text('Camera'),
                      onTap: () {
                        Navigator.of(context).pop();
                        _getImageFromCamera();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey,
        child: _image != null
            ? ClipOval(
          child: Image.file(
            _image!,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        )
            : FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (BuildContext context,
              AsyncSnapshot<SharedPreferences> snapshot) {
            if (snapshot.hasData) {
              String? imagePath = snapshot.data!.getString('imagePath');
              return imagePath != null
                  ? ClipOval(
                child: Image.file(
                  File(imagePath),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              )
                  : Icon(
                Icons.camera_alt,
                size: 30,
                color: whiteTextColor,
              );
            } else {
              return Icon(
                Icons.camera_alt,
                size: 30,
                color: whiteTextColor,
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _name);
  }

  File? _image;

  Future<void> _getImageFromGallery() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        SharedPreferences.getInstance().then((prefs) {
          prefs.setString('imagePath', pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _getImageFromCamera() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        SharedPreferences.getInstance().then((prefs) {
          prefs.setString('imagePath', pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    });
  }

  Widget textFieldName() {
    return Expanded(
      child: TextField(
        style: TextStyle(
          color: whiteTextColor,
        ),
        textAlign: TextAlign.center,
        controller: _nameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: profileColor,
          hintText: "Введите имя",
          hintStyle: TextStyle(
            color: buttonColor,
          ),
        ),
      ),
    );
  }

  Widget buildRectangles() {
    return Container(
      height: 455,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _rectangles.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(25),
            width: 319,
            height: 212,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                _rectangles[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget statisticButton(BuildContext context) {
    return SizedBox(
      width: 319,
      child: Container(
        height: 63,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StatisticsPageState()),
            );
          },
          icon: Image.asset('assets/Icons/statistics.png'),
          label: Text(
            'Статистика',
            style: TextStyle(color: whiteTextColor),
          ),
          style: ElevatedButton.styleFrom(
            primary: profileColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfilePageContainer() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: backgroundColor,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset('assets/Icons/settings.png'),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 15),
                  avatarImage(),
                  SizedBox(width: 15),
                  textFieldName(),

                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: buttonColor,
                        elevation: 0,
                      ),
                      onPressed: () {
                        setState(() {
                          _name = _nameController.text;
                        });
                      },
                      child: Icon(Icons.check),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              statisticButton(context),
              SizedBox(height: 15),
              buildRectangles(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildProfilePageContainer(),
      ),
    );
  }
}