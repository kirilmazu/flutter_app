import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/LectureRoute.dart';
import 'package:flutter_app/Communication.dart';

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
        buildLecturersRow(card.lecturers),
      ],
    ),
  );
}

//if lecture have lecturer add him to the card else it just some event and return empty container
Widget buildLecturersRow(List<Lecturer> lecturers) {
  if (lecturers != null && lecturers.isNotEmpty)
    return Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.person),
          buildLecturers(lecturers),
        ],
      ),
    );
  else
    return Container();


}

Widget buildLecturers(List<Lecturer> lecturers) {
  return Container(
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: lectureCards.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(lecturers[index].name, style: TextStyle(fontSize: 18.0));
      },
    ),
  );
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
List<LectureCard> lectureCards = Communication.getLectureCards();