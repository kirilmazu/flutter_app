import 'package:flutter/material.dart';
import 'package:flutter_app/Communication.dart';
import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/LecturerRoute.dart';


class LectureRout extends StatelessWidget{
  final Lecture lecture; //todo: change name

  LectureRout({Key key, @required this.lecture}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lecture.lectureName),
      ),

      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(lecture.lectureName,
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),),
            Divider(
              color: Colors.lightBlue,
            ),
            BuildTime(card: lecture,),
            BuildPlace(card: lecture,),
            buildLecturers(lecture.lecturers),
            Divider(
              color: Colors.lightBlue,
            ),

            BuildDescription(card: lecture,),

            Divider(
              color: Colors.lightBlue,
            ),
            //BuildButton(lectureId: card.lectureId,),
          ]
      ),
      ),
    );
  }

}

class BuildTime extends StatelessWidget {
  BuildTime({this.card});
  @required final Lecture card;

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

class BuildDescription extends StatelessWidget {
  BuildDescription({this.card});
  @required final Lecture card;

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
  @required final Lecture card;

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
  BuildButton({this.lectureId});
  @required final int lectureId;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      child: RaisedButton(
        child: Text("Add to planner"),
        onPressed: () {
          Communication.registerToLecture(lectureId);
        },
      ),
    );
  }
}

Widget buildLecturers(List<Lecturer> lecturers) {
  if(lecturers != null && lecturers.isNotEmpty) return Container(
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: lecturers.length,
      itemBuilder: (BuildContext context, int index) {
        return BuildLecturer(lecturer: lecturers[index],);
      },
    ),
  );
  else return Container();
}

class BuildLecturer extends StatelessWidget {
  BuildLecturer({this.lecturer});

  @required final Lecturer lecturer;

  @override
  Widget build(BuildContext context) {
    if (lecturer != null)
      return Container(
        child: InkWell(
            child: Row(
              children: <Widget>[
                icon(lecturer),
                text(lecturer),
              ],),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LecturerRout(lecturer: lecturer,)),
              );
            }),
      );
    else
      return Container();
  }

  Widget icon(Lecturer lecturer) {
    if (lecturer.main)
      return Icon(Icons.person);
    else
      return Icon(Icons.person_outline);
  }

  Widget text(Lecturer lecturer) {
    if (lecturer.main)
      return Text(lecturer.name,
        style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),);
    else
      return Text(lecturer.name, style: TextStyle(fontSize: 20.0),);
  }
}
