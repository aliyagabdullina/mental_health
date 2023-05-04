import 'package:Mental_Health/main.dart';
import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color greyButtomColor = Color(0xFFD9D9D9);

class NoticePageState extends StatefulWidget {
  NoticePageState({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildNoticePageContainer(),
      ),
    );
  }

  Widget buildNoticePageContainer() {
    List<String> titles = [
      "Здоровье",
      "Духовность",
      "Социальная жизнь",
      "Производительность",
      "Яркость жизни",
      "Забота о себе"
    ];
    List<Image> icons = [
      Image.asset('assets/Icons/NotionIcons/DoingSport.png'),
      Image.asset('assets/Icons/NotionIcons/Walk.png'),
      Image.asset('assets/Icons/NotionIcons/HealthySleep.png'),
      Image.asset('assets/Icons/NotionIcons/HealthyNutrition.png'),
      Image.asset('assets/Icons/NotionIcons/Meditation.png'),
      Image.asset('assets/Icons/NotionIcons/Gratitude.png'),
      Image.asset('assets/Icons/NotionIcons/GoodDeed.png'),
      Image.asset('assets/Icons/NotionIcons/YogaClass.png'),
      Image.asset('assets/Icons/NotionIcons/Communication.png'),
      Image.asset('assets/Icons/NotionIcons/TimeWithFamily.png'),
      Image.asset('assets/Icons/NotionIcons/HeartConversation.png'),
      Image.asset('assets/Icons/NotionIcons/SolvingProblem.png'),
      Image.asset('assets/Icons/NotionIcons/LearningNew.png'),
      Image.asset('assets/Icons/NotionIcons/NetworksLimit.png'),
      Image.asset('assets/Icons/NotionIcons/PleasantAtmosphere.png'),
      Image.asset('assets/Icons/NotionIcons/TimeToRest.png'),
      Image.asset('assets/Icons/NotionIcons/Hobby.png'),
      Image.asset('assets/Icons/NotionIcons/Creation.png'),
      Image.asset('assets/Icons/NotionIcons/CulturalEvent.png'),
      Image.asset('assets/Icons/NotionIcons/TryNewOne.png'),
      Image.asset('assets/Icons/NotionIcons/Care.png'),
      Image.asset('assets/Icons/NotionIcons/TimeWithYourself.png'),
      Image.asset('assets/Icons/NotionIcons/UsefulHabits.png'),
      Image.asset('assets/Icons/NotionIcons/KeepingDiary.png'),
    ];
    List<String> texts = [
      "Занятие спортом",
      "Прогулка",
      "Здоровый сон",
      "Полезное питание",
      "Медитация",
      "Благодарность",
      "Доброе дело",
      "Занятие йогой",
      "Общение с людьми",
      "Время с семьей",
      "Разговор по душам",
      "Решение проблемы",
      "Изучение нового",
      "Лимит соц сетей",
      "Приятная атмосфера",
      "Время на отдых",
      "Хобби",
      "Творчество",
      "Культурное событие",
      "Попробовать новое",
      "Уход",
      "Время с собой",
      "Полезные привычки",
      "Ведение дневника",
    ];

    return Container(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: 390,
              color: backgroundColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Чем вы занимались?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _BlockWidget(
                      text: texts[0],
                      icon: icons[0],
                      title: titles[0],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _BlockWidget(
                      text: texts[1],
                      icon: icons[1],
                      title: titles[1],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _BlockWidget(
                      text: texts[2],
                      icon: icons[2],
                      title: titles[2],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _BlockWidget(
                      text: texts[3],
                      icon: icons[3],
                      title: titles[3],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _BlockWidget(
                      text: texts[4],
                      icon: icons[4],
                      title: titles[4],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _BlockWidget(
                      text: texts[5],
                      icon: icons[5],
                      title: titles[5],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _TextNotion(),
                    SizedBox(
                      height: 20,
                    ),
                    _PhotoWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _SaveButton(),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: 430,
            height: 92,
            child: BottomPanel(),
          ),
        ],
      ),
    );
  }
}

class _PhotoWidget extends StatelessWidget {
  const _PhotoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 390,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text('Фото',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))),
          SizedBox(
            height: 17,
          ),
          Container(),
        ],
      ),
    );;
  }
}

class _TextNotion extends StatelessWidget {
  const _TextNotion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 10,
      minLines: 1,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.done,
      cursorColor: Colors.white,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Заметка',
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Нажмите, чтобы добавить заметку',
        helperStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.all(30),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(backgroundColor),
          foregroundColor:
              MaterialStateProperty.all(Colors.white),
          overlayColor:
              MaterialStateProperty.all(Colors.white12),
          elevation: MaterialStateProperty.all(5),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                  horizontal: 25, vertical: 15)),
          shape:
              MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(color: Colors.white),
          )),
        ),
        onPressed: () {},
        child: Text(
          "Сохранить",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold),
        ));
  }
}

class _BlockWidget extends StatelessWidget {
  final String title;
  final String text;
  final Image icon;

  const _BlockWidget({
    super.key,
    required this.title,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 390,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))),
          SizedBox(
            height: 17,
          ),
          Row(
            children: [
              _IconAndTextWidget(icon: icon, text: text),
              _IconAndTextWidget(icon: icon, text: text),
              _IconAndTextWidget(icon: icon, text: text),
              _IconAndTextWidget(icon: icon, text: text),
            ],
          )
        ],
      ),
    );
  }
}

class _IconAndTextWidget extends StatelessWidget {
  const _IconAndTextWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final Image icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Действие, которое будет выполняться при нажатии на кнопку
              },
              child: icon,
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                minimumSize: Size(80, 80),
                primary: greyButtomColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(text, style: TextStyle(color: Colors.white, fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
