import 'dart:async' as prefix0;

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
//import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class RegisterRout extends StatelessWidget {
  final fullNameController = TextEditingController();
  final companyController = TextEditingController();
  final emailController = TextEditingController();
  final roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),

      body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget> [
            buildTextField("Email", emailController),
            buildTextField("Full name", fullNameController),
            buildTextField("Company", companyController),
            buildTextField("Role", roleController),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildRegisterButton(context),
                    buildCancelButton(context),
                  ],
            ),
          ],
        ),
      ),
      ),
    );
  }


  Widget buildTextField(String text, TextEditingController controller) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Padding(
        padding: EdgeInsets.only(top: 15, left: 60, right: 60),
        child: TextField(
          controller: controller,
          decoration: new InputDecoration(
              hintText: text
          ),
        ),
      ),
    );
  }

  Widget buildRegisterButton(BuildContext context){
    return Container(
      alignment: AlignmentDirectional.center,
      child:
      Center(
        child: RaisedButton(
          child: Text("Register"),
          onPressed: (){
            if(emailController.text != "" && fullNameController.text != "" && companyController.text != "" && roleController.text != ""){
              //if all the fild filled

            }else{
              //check user na

              //login

              //and go back to main screen
              Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
            }
          },
        ),
      ),
    );
  }

  Widget buildCancelButton(BuildContext context){
    return Container(
      alignment: AlignmentDirectional.center,
      child:
      Center(
        child: RaisedButton(
          child: Text("Cancel"),
          onPressed: (){
            //return to login rout
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

/*
class Storage{
  Future<String> get localPath async{
    final dir = await
    return dir.path;
  }

  Future<File> get localFile async{
    final path = await localPath;
    return File('$path/user.txt');
  }

  Future<String> readData() async{
    try{
      final file = await localFile;
      String body = await file.readAsString();

      return body;
    }catch(e){
      return e.toString();
    }
  }

  Future<File> writeData(String data) async{
    final file = await localFile;
    return file.writeAsString("$data");
  }

}*/