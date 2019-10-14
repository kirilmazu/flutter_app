import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*class LoginRout extends StatelessWidget {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),

      body: Center(
        child: Column(
          children: <Widget> [
            //need to add icon
            /*VerticalPadding(
              child: _buildIcon(),
            ),*/

            VerticalPadding(
              child: _buildTextFild("User name", userNameController),
            ),
            VerticalPadding(
              child: _buildTextFild("Password", passwordController),
            ),
            VerticalPadding(
              child: _buildButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFild(String text, TextEditingController controller) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Padding(
        padding: EdgeInsets.only(top: 15, left: 40, right: 40),
        child: TextField(
          controller: controller,
          decoration: new InputDecoration(
              hintText: text
        ),
      ),
      ),
    );
  }

  Widget _buildButton(){
    return Container(
      alignment: AlignmentDirectional.center,
      child: RaisedButton(
        child: Text("Login"),
        onPressed: (){
          if(userNameController.text != "" && passwordController.text != ""){
            //if the user or password empty show message
          }else{
            //check user name and password
          }
        },
      ),
    );
  }
}

class VerticalPadding extends StatelessWidget{
  VerticalPadding({
    @required this.child,
    this.padding = 16.0,
  });

  final double padding;
  final Widget child;

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: child,
    );
  }
}*/



class LoginRout extends StatelessWidget {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),

      body: Center(
        child: Column(
          children: <Widget> [
            buildImage(),
            buildTextField("User name", userNameController),
            buildTextField("Password", passwordController),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Padding(
        padding: EdgeInsets.only(top: 15, left: 60, right: 60),
        child: Image.network(
            'http://placeimg.com/640/480/any',
          width: 230,
          height: 230,
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

  Widget buildButton(){
    return Container(
      alignment: AlignmentDirectional.center,
      child:
      Center(
        child: RaisedButton(
          child: Text("Login"),
          onPressed: (){
            if(userNameController.text != "" && passwordController.text != ""){
              //if the user or password empty show message
            }else{
              //check user name and password
            }
          },
        ),
      ),
    );
  }
}
