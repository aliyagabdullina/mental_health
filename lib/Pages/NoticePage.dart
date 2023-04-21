import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);
Color grayButtomColor = Color(0xFFD9D9D9);

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
      width: 390,
      color: backgroundColor,
      child: Stack(
        children: [
          Center(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 45),
              itemCount: titles.length,
              itemBuilder: (BuildContext context, int index) {
                return _BlockWidget(
                  text: texts[index % texts.length],
                  icon: icons[index % icons.length],
                  title: titles[index % titles.length],
                );
              },
            ),
          ),
        ],
      ),
    );
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
      height: 200.0,
      width: 390,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.white,
          width: 2.0,
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
                      color: Color(0xFFF6F6F6),
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
              primary: grayButtomColor,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(text, style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 15)),
        ],
      ),
    );
  }
}