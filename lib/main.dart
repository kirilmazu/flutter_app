import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/LoginRoute.dart';
import 'package:flutter_app/NoteRoute.dart';
import 'package:flutter_app/ConferenceRoute.dart';
import 'package:flutter_app/SettingsRout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main title',
      debugShowCheckedModeBanner: false, //remove the debug leble from the top
      theme: ThemeData(
        // This is the theme of your application.
        primaryColor: Colors.lightBlue[900], //the color of the top bar
        accentColor: Colors.lightBlue[800], //the colore of screan drug
        brightness: Brightness.dark,

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
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choise){
                return PopupMenuItem<String>(
                  value: choise,
                  child: Text(choise),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          makeCards,
        ],
      ),
    );
  }

  void choiceAction(String choice){
    if(choice == Constants.Notes){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoteRoute()),
      );
    }
    else if(choice ==Constants.LogIn){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginRout()),
      );
    }
    else if(choice ==Constants.Settings){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsRout()),
      );
    }
  }

  //make clickable cards from myCards list
  final makeCards = Container(
    child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: myCards.length,
        itemBuilder: (BuildContext context, int index){
          return makeGestureDetector(myCards[index],context);
        },
    ),
  );
}

//make the card clickable
GestureDetector makeGestureDetector(myCard card, BuildContext context) => GestureDetector(
  onTap: (){Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ConferenceRoute(card: card,)),
  );},
  child: makeCard(card),
);

Card makeCard(myCard card) => Card(
  child: Padding(
    padding: EdgeInsets.all(24.0),
    child: Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        card.image,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(card.date, style: TextStyle(fontSize: 10.0)),
              Text(card.place, style: TextStyle(fontSize: 10.0)),
              Text(card.title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              Text(card.description, maxLines: 2, overflow:  TextOverflow.ellipsis, ),
            ],
          ),
        )
      ],
    ),
  ),
);


//data for testing
List<myCard> myCards = [
  myCard(title: 'Conference 1',
        description: 'Few words about the first conferens',
        image: Image.network(
        'http://placeimg.com/640/480/any',
        width: 100,
        height: 70,
  ),
        place: 'Some place 1',
        date:  '1/1/2020',
  ),
  myCard(title: 'Conference 2',
      description: 'Few words about the second conferens, and this line need to be longer.',
      image: Image.network(
        'http://placeimg.com/640/480/any',
        width: 100,
        height: 70,
      ),
      place: 'Some place 1',
      date:  '1/1/2020',
  ),
];
