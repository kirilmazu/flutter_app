import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';

bool darkTeam = Constants.darkTeam;
class SettingsRout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("dark team"),
                  Switch(value: Constants.darkTeam, onChanged: changeTeam,),
                ],
              )
            ],
      ),
    );
  }

  void changeTeam(bool value){
    Constants.darkTeam = value;
  }
}
