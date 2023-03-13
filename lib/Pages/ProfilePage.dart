import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';
import 'dart:io';
//import 'package:image_picker/image_picker.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);


class ProfilePageState extends StatefulWidget {
  ProfilePageState({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildProfilePageContainer(),
      ),
    );
  }

  Widget buildProfilePageContainer() {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      /*child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Icon(Icons.settings),
          Row(
              children: [
                GestureDetector(
                  onTap: getImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null ? Icon(Icons.person) : null,
                  ),
                ),
                TextField(),
              ]
          ),
        ],
      ),*/
    );
  }
}

/*
class MyCircleAvatar extends StatefulWidget {
  @override
  _MyCircleAvatarState createState() => _MyCircleAvatarState();
}

class _MyCircleAvatarState extends State<MyCircleAvatar> {
  File? _image;

  Future getImage() async {
    final pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}*/