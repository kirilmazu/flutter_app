import 'package:flutter/material.dart';
import 'package:flutter_app/Communication.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/Constants.dart';

//TODO: remove this class

class TestsRout extends StatelessWidget{

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              //buildTextField(),
              Text("test string result: " , style: TextStyle(fontSize: 10.0)),
            ],
          ),
        ),
      ),
    );
  }


  Future<Container> buildTextField() async{
  String myQuery = "select * from "  + DataBaseConstant.conferenceTableName;
  Results results = await DataBaseCommunication.runQuery(myQuery);
  String conferenss = "";
  for(var row in results) {
    conferenss += row.toString();
  }

  return Container(
  child:Text("test string result: " , style: TextStyle(fontSize: 10.0)),
  );
  }
}
