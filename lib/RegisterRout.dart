import 'package:flutter/material.dart';
import 'package:flutter_app/Communication.dart';
import 'package:flutter_app/Constants.dart';
import 'package:fluttertoast/fluttertoast.dart';


// ignore: must_be_immutable
class RegisterRout extends StatelessWidget {
  var fullNameController = TextEditingController();
  var companyController  = TextEditingController();
  var emailController    = TextEditingController();
  var roleController     = TextEditingController();

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
            buildTextForField(),
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

  Widget buildTextForField() {
    //if the user empty try to load.
    if(currentUser == null) Storage.loadUser();
    //if still empty fill as hintText else fill the date.
    if(currentUser != null){
      fullNameController = TextEditingController(text: currentUser.fullName);
      companyController  = TextEditingController(text: currentUser.company);
      emailController    = TextEditingController(text: currentUser.email);
      roleController     = TextEditingController(text: currentUser.role);
    }
    return Container();
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
              //if all the fields filled
              User user = new User(email: emailController.text, fullName: fullNameController.text, company: companyController.text, role: roleController.text);
              currentUser = user;
              Storage.saveUser(user);
              DataBaseCommunication.insertUser(user);
              Fluttertoast.showToast(msg: 'User registered');
              Navigator.pop(context);
            }else Fluttertoast.showToast(msg: 'Please fill all the fields');
          },
        ),
      ),
    );
  }

  Widget buildCancelButton(BuildContext context){
    return Container(
      alignment: AlignmentDirectional.center,
      child: Center(
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