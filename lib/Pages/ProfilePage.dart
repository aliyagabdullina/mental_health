import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

import 'package:Mental_Health/Pages/Panel.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);
Color buttonColor = Color(0xFFB6B6B6);

class ProfilePageState extends StatefulWidget {
  ProfilePageState({Key? key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePageState> {
  late TextEditingController _nameController;
  String _name = "";

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _name);
  }

  File? _image;

  Future<void> _getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _getImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
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
            : Icon(
          Icons.camera_alt,
          size: 30,
          color: whiteTextColor,
        ),
      ),
    );
  }

  Widget textFieldName() {
    return Expanded(
      child: TextField(
        controller: _nameController,
        decoration: InputDecoration(
          hintText: "Введите ваше имя",
        ),
      ),
    );
  }

  Widget buildProfilePageContainer() {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Icon(Icons.settings),
          SizedBox(height: 20),
          Row(
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
              avatarImage(),
              SizedBox(width: 15),
              textFieldName(),
              SizedBox(
                width: 50,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor,
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
        ],
      ),
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
