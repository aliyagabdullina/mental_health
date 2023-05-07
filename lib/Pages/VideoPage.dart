import 'package:Mental_Health/Pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';
import 'package:Mental_Health/Pages/YogaPage.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class VideoPageState extends StatefulWidget {
  VideoPageState({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildVideoPageContainer(),
      ),
    );
  }

  Widget buildVideoPageContainer() {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
            ),
            _VideoPhotoWidget(image: Image.asset('assets/Images/Yoga1.jpg', width: 380, height: 210, fit: BoxFit.cover),),
            SizedBox(
              height: 10,
            ),
            _NewsNumberWidget(),
            SizedBox(
              height: 10,
            ),
            _VideoTextWidget()
          ],
        ),
          Positioned(
            bottom: 0,
            width: 430,
            height: 92,
            child: BottomPanel(),
          )
        ],
      ),
    );
  }
}

class _VideoTextWidget extends StatelessWidget {
  const _VideoTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        'Йога – это отличный способ отвлечься от проблем и избавиться от ненужных мыслей. Она помогает познать себя как внешне, так и изнутри. Уже на первых занятиях вы сделаете большой шаг на пути к владению своим телом и управлению дыханием. Кроме того, как и все физические упражнения, йога позволяет держать мышцы в тонусе',
        style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 20),
      ),
    );
  }
}

class _NewsNumberWidget extends StatelessWidget {
  const _NewsNumberWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Хатха Йога",
                style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 35),
              ),
            ),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Новичок",
                style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "25 минут",
                style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _VideoPhotoWidget extends StatelessWidget {
  final Image image;
  const _VideoPhotoWidget({
    super.key, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 370,
          height: 370,
          child: image,
        ),
        TextButton(
          onPressed: () { Navigator.pop(context);},
          child: Positioned(
            top: 20,
            left: 20,
            child: Image.asset('assets/Icons/ArrowRight.png'),
          ),
        ),
        Container(
          width: 370,
          height: 370,
          child: Align(
            alignment: Alignment.center,
            child: Image.asset('assets/Icons/Video.png'),
          ),
        )
      ],
    );
  }
}
