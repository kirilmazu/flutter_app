import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';


class LecturerRout extends StatelessWidget {

  final Lecturer lecturer;

  LecturerRout({Key key, @required this.lecturer}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lecturer name"),
      ),

      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Text(lecturer.name, style: TextStyle(fontSize: 20.0,),),
          ]

      ),
    );
  }


}