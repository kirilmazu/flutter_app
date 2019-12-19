import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/Communication.dart';
import 'package:flutter_app/RegisterRout.dart';
import 'package:flutter_app/NoteRoute.dart';
import 'package:flutter_app/ConferenceRoute.dart';
import 'package:flutter_app/AboutRout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Brightness brightness;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main title',
      debugShowCheckedModeBanner: false, //remove the debug label from the top
      theme: ThemeData(
        // This is the theme of your application.
        primaryColor: Colors.lightBlue[900], //the color of the phone up bar
        accentColor: Colors.lightBlue[800], //the color of the appbar
        brightness: Constants.brightness,//Brightness.dark,

        // Define the default font family.
        fontFamily: 'Montserrat',
      ),
      home: MyHomePage(title: 'App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
        actions: <Widget>[
          //create the three dots menu in the appbar
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: SingleChildScrollView( //make a list of all conferenceCards we get
        child: Column(
          children: <Widget>[
            makeCards,
          ],
        ),
      )
    );
  }

  //move to relevant page after the user select option in the three dots menu in the appbar
  void choiceAction(String choice){
    if(choice == Constants.Notes){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoteRoute()),
      );
    }
    else if(choice ==Constants.Register){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterRout()),
      );
    }
    else if(choice ==Constants.About){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AboutRout()),
      );
    }
  }

  //make list of clickable cards from conferenceCards list
  final makeCards = Container(
    child: ListView.builder( //build list of items
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: conferenceCards.length,
        itemBuilder: (BuildContext context, int index){
          return makeGestureDetector(conferenceCards[index],context); // build list of conferenceCards
        },
    ),
  );
}

//make the card clickable
GestureDetector makeGestureDetector(ConferenceCard card, BuildContext context) => GestureDetector(
  onTap: (){Navigator.push( //on click move to ConferenceRoute with the conferenceCard data
    context,
    MaterialPageRoute(builder: (context) => ConferenceRoute(card: card,)),
  );},
  child: makeCard(card),
);

//make the conferenceCard
Card makeCard(ConferenceCard card) => Card(
  child: Padding(
    padding: EdgeInsets.all(10.0),
    child: Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        card.image,//add image to the card
        Container(//make space between the image and the text
          width: 8,
        ),
        Expanded(
          child: Column(//add the text of the card
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(card.date, style: TextStyle(fontSize: 10.0)),//the first line is the date
              Text(card.place, style: TextStyle(fontSize: 10.0)),//the second line is the location
              Text(card.title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),), //the threes line is conference name
              Text(card.description, maxLines: 2, overflow:  TextOverflow.ellipsis, ), //the fourth line is one or two lines of description
            ],
          ),
        )
      ],
    ),
  ),
);

//gat the data from flutter_app/Data.dart
List<ConferenceCard> conferenceCards = Communication.getConferenceCards();