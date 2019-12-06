import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/LectureRoute.dart';
import 'package:flutter_app/Communication.dart';


class ConferenceRoute extends StatelessWidget{

  final ConferenceCard card;

  ConferenceRoute({Key key, @required this.card}):super(key: key);

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("Conference name"),
      ),

      body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //the conference data:
                  Center( child: card.image,),
                  Text(card.date, style: TextStyle(fontSize: 18.0)),
                  Text(card.place, style: TextStyle(fontSize: 18.0)),
                  Text(card.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  Text(card.description,),
                  Divider(
                    color: Colors.indigo,
                  ),
                  BuildButton(conferenceId: card.conferenceID,),
                  //the conference lectures:
                  makeCards,
                ],
              ),
      ),
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
              //the lecture name:
              Text(
                card.lecture,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              //the location:
              Row(
                children: <Widget>[
                  Icon(Icons.location_on),
                  Text(card.place, style: TextStyle(fontSize: 18.0), maxLines: 1, overflow: TextOverflow.ellipsis,),
                ],
              ),
              //the lecturers:
              buildLecturers(card),
            ],
          ),
        )
      ],
    ),
  ),
);

String lecturers = "";

Widget buildLecturers(LectureCard lecture){
  if(lecture != null && lecture.lecturers != null && lecture.lecturers.isNotEmpty){
    for(int i =0;i < lecture.lecturers.length; i++){
      if(i != 0) lecturers += ", ";
      lecturers += lecture.lecturers[i].name;
    }
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            child:  Text(lecturers, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18.0), softWrap: false, )
          ),
          ],
      ),
    );
  }else return Container();
}

class BuildButton extends StatelessWidget {

  BuildButton({this.conferenceId});
  @required final int conferenceId;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      child: RaisedButton(
        child: Text("Add to planner"),
        onPressed: () {
          Communication.registerToConference(conferenceId);
        },
      ),
    );
  }
}

//data for test
List<LectureCard> lectureCards = Communication.getLectureCards();