import 'package:flutter/material.dart';


class RegisterRout extends StatelessWidget {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
            buildTextField("User name", userNameController),
            buildTextField("Password", passwordController),
            buildTextField("Confirm password", confirmPasswordController),
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
            if(userNameController.text != "" && passwordController.text != ""){
              //if the user or password empty show message
            }else{
              //check user name and password

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
