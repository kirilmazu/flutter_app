import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/LecturerRoute.dart';


class LectureRout extends StatelessWidget{

  final LectureCard card;

  LectureRout({Key key, @required this.card}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lecture name"),
      ),

      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(card.lecture,
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),),
            Divider(
              color: Colors.lightBlue,
            ),
            BuildTime(card: card,),
            BuildPlace(card: card,),
            BuildLecturer(card: card,),
            Divider(
              color: Colors.lightBlue,
            ),

            BuildDescription(card: card,),

            Divider(
              color: Colors.lightBlue,
            ),
            BuildButton(),
          ]
      ),
      ),
    );
  }

}

class BuildTime extends StatelessWidget {

  BuildTime({this.card});
  @required final LectureCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.access_time),
          Text(card.startTime + " - " + card.endTime, style: TextStyle(fontSize: 20.0,),),
        ],
      ),
    );
  }
}

class BuildLecturer extends StatelessWidget {

  BuildLecturer({this.card});
  @required final LectureCard card;

  @override
  Widget build(BuildContext context) {
    if(card.lecturer != null)
    return Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.person),
          InkWell(
            child: Text(card.lecturer.name, style: TextStyle(fontSize: 20.0),),
            onTap: (){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LecturerRout(lecturer: card.lecturer,)),
              );
            },
          ),
        ],
      ),
    );
    else return Container();
  }
}

class BuildDescription extends StatelessWidget {

  BuildDescription({this.card});
  @required final LectureCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(card.description, style: TextStyle(fontSize: 20.0,),),
        ],
      ),
    );
  }
}

class BuildPlace extends StatelessWidget {

  BuildPlace({this.card});
  @required final LectureCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.place),
          Text(card.place, style: TextStyle(fontSize: 20.0,),),
        ],
      ),
    );
  }
}

class BuildButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      child: RaisedButton(
        child: Text("Add to planner"),
        onPressed: () {

        },
      ),
    );
  }
}