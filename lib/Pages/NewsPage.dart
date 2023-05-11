import 'package:Mental_Health/Pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class NewsPageState extends StatefulWidget {
  NewsPageState({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildNewsPageContainer(),
      ),
    );
  }

  Widget buildNewsPageContainer() {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
              ),
              _NewsPhotoWidget(
                image:
                Image.asset('assets/Images/News1.jpg', fit: BoxFit.cover),
              ),
              SizedBox(
                height: 10,
              ),
              _NewsNumberWidget(),
              SizedBox(
                height: 10,
              ),
              _NewsTextWidget()
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

class _NewsTextWidget extends StatelessWidget {
  const _NewsTextWidget({
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
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "Новость 1",
        style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 35),
      ),
    );
  }
}

class _NewsPhotoWidget extends StatelessWidget {
  final Image image;

  const _NewsPhotoWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Stack(
        children: [
          Container(
            width: 370,
            height: 370,
            child: image,
          ),
          Positioned(
            top: 10,
            left: 10,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Image.asset('assets/Icons/ArrowRight.png')),
          ),
        ],
      ),
    );
  }
}