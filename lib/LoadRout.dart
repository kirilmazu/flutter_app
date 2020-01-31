import 'package:flutter/material.dart';
import 'package:flutter_app/Communication.dart';
import 'Constants.dart';

class LoadRout extends StatelessWidget {
  LoadRout({Key key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:Column(
            children: <Widget>[
              Image.asset('images/Conference_big.jpg',),
              Container(//make space
                height: 25,
              ),
              CircularProgressIndicator(),
              Container(//make space
                height: 25,
              ),
              Text("Loading data", style: TextStyle(fontSize: 20.0,),),
              loadDate(context),
            ],
          )
      ),
    );
  }

  Container loadDate(BuildContext context){
    try {
      DataBaseCommunication.loadData(true).then((result) {
        Storage.loadUser();
        Navigator.popUntil(
            context, ModalRoute.withName(Navigator.defaultRouteName));
      });
    }catch(e) {print("ERROR: " + e.toString());}
    return Container();
  }
}