import 'package:flutter/material.dart';

class AboutRout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //TODO: add text, from server?
              Text("About this app",
                style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
              ),
              Divider(
                color: Colors.indigo,
              ),
              Text("Version: 1.0"),
              Text("And mere.....\nAnd it can to be long one\nSo just add atext hear."),
            ]),
          ),
        ],
      ),
    );
  }
}