import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/DayRoute.dart';


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
                  Center( child: card.image,),
                  Text(card.date, style: TextStyle(fontSize: 18.0)),
                  Text(card.place, style: TextStyle(fontSize: 18.0)),
                  Text(card.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  Text(card.description,),
                  Divider(
                    color: Colors.indigo,
                  ),
                  BuildButton(),
                ],
              ),
      ),
    );
  }
}

class BuildButton extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        alignment: AlignmentDirectional.center,
        child: RaisedButton(
          child: Text("Day 1"),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DayRoute()),
            );
          },
        ),
      ),
    );
  }
}