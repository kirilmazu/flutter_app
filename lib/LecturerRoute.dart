import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';


class LecturerRout extends StatelessWidget {

  final Lecturer lecturer;

  LecturerRout({Key key, @required this.lecturer}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lecturer.name),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            FadeInImage.assetNetwork(//add image to the card
              placeholder: Constants.defaultImage,
              image: lecturer.imageUrl,
              height: Constants.imageW,
              width: Constants.imageW,
            ),
            Text(lecturer.name, style: TextStyle(fontSize: 20.0,),),
            Text(lecturer.company + ',' + lecturer.role, style: TextStyle(fontSize: 20.0,),),
            Divider(color: Colors.indigo,),
            Text(lecturer.cv, style: TextStyle(fontSize: 20.0,),),
          ]

      ),
      ),
    );
  }
}