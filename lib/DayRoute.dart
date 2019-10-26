import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/LectureRoute.dart';

class DayRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day name"),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SingleChildScrollView(
              child: makeCards,
            )
          ]),
    );
  }

  final makeCards = Container(
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: lectureCards.length,
      itemBuilder: (BuildContext context, int index) {
        return makeGestureDetector(lectureCards[index], context);
      },
    ),
  );
}

Widget buildContent(LectureCard card) {
  return Container(
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.location_on),
            Text(card.place, style: TextStyle(fontSize: 18.0)),
          ],
        ),
        buildLecturer(card.lecturer),
      ],
    ),
  );
}

//if lecture have lecturer add him to the card else it just some event and return empty container
Widget buildLecturer(Lecturer lecturer) {
  if (lecturer != null && lecturer.name != null)
    return Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.person),
          Text(lecturer.name, style: TextStyle(fontSize: 18.0)),
        ],
      ),
    );
  else
    return Container();
}

//make the card clickable
GestureDetector makeGestureDetector(LectureCard card, BuildContext context) =>
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LectureRout(
                    card: card,
                  )
          ),
        );
      },
      child: makeCard(card),
    );

Card makeCard(LectureCard card) => Card(
  child: Padding(
    padding: EdgeInsets.all(10.0),
    child: Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(children: <Widget>[
          Text(card.startTime, style: TextStyle(fontSize: 15.0)),
          Text(card.endTime, style: TextStyle(fontSize: 15.0)),
        ]),
        Container(
          width: 8,
        ),
        Expanded(
          child: Column(//add the text of the card
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                card.lecture,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              buildContent(card),
            ],
          ),
        )
      ],
    ),
  ),
);

//data for test
List<LectureCard> lectureCards = [
  LectureCard(
    lectureId: 1,
    startTime: "08:00",
    endTime: "09:00",
    lecture: "Registration",
    place: "First place",
    description: "Some description",
  ),
  LectureCard(
    lectureId: 2,
    startTime: "09:00",
    endTime: "11:00",
    lecture: "Lecture 1",
    lecturer: new Lecturer(name: "Lecturer 1"),
    place: "Place 1",
    description:
        "Some description, and this one is a very long one, and it need to take fuul page\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nthe end\n",
  ),
  LectureCard(
    lectureId: 3,
    startTime: "09:00",
    endTime: "11:00",
    lecture: "Lecture 2",
    lecturer: new Lecturer(name: "Lecturer 2"),
    place: "Place 2",
    description: "Some description",
  ),
  LectureCard(
    lectureId: 4,
    startTime: "11:00",
    endTime: "13:00",
    lecture:
        "Lecture with along name, for test long name as it can be in the academy, with a few lins",
    //lecture: "Lecture 3",
    lecturer: new Lecturer(name: "Lecturer 1"),
    place: "Place 1",
    description: "Some description",
  ),
  LectureCard(
    lectureId: 5,
    startTime: "13:00",
    endTime: "14:00",
    lecture: "Lanch",
    place: "Place 3",
    description: "Some description",
  ),
  LectureCard(
    lectureId: 6,
    startTime: "14:00",
    endTime: "16:00",
    lecturer: new Lecturer(name: "Lecturer 3"),
    lecture: "Lecture 4",
    place: "Place 1",
    description: "Some description",
  ),
];