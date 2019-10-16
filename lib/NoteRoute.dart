import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';

List<Note> allNotes = [
  Note(subject: 'subject for test 1', body: 'This is the body of the first nete for test'),
  Note(subject: 'subject for test 2', body: 'This is the body of the second nete for test'),
  Note(
      subject: 'subject for test long note with long body',
      body: 'This is the body of the very very very long nete for test it and see it work.\n and maby some more lines\n and more.'),
  Note(subject: 'subject for test 4', body: 'This is the body of the 3 nete for test'),
];

class NoteRoute extends StatelessWidget{
  final subjectController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            VerticalPadding(
              padding: 10,
              child: _buildSubjectTextField("Type here the subject of new note", subjectController),
            ),
            VerticalPadding(
              padding: 10,
              child: _buildBodyTextField("Type here the body of new note and press the 'add' button", bodyController),
            ),
            VerticalPadding(
              padding: 8,
              child: _buildButton(context),
            ),
            VerticalPadding(
              padding: 5,
              child: Divider(
                color: Colors.indigo,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [
                NotesList(),
                ]
            )
          ]
        )
      )
    );
  }


  Widget _buildSubjectTextField(String text, TextEditingController controller){
    return Container(
      alignment: AlignmentDirectional.center,
      child:  Padding(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: TextField(
          controller: controller,
          decoration: new InputDecoration(
              hintText: text
          ),
        ),
      ),
    );
  }

  Widget _buildBodyTextField(String text, TextEditingController controller){
    return Container(
      alignment: AlignmentDirectional.center,
      child:  Padding(
        padding: EdgeInsets.only(left: 15, right: 12),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: 2,
          controller: controller,
          decoration: new InputDecoration(
              hintText: text
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context){
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      child: RaisedButton(
        child: Text("Add"),
        onPressed: (){
          if(subjectController.text != "" && bodyController.text != "")
            allNotes.add(new Note(subject: subjectController.text, body: bodyController.text));
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }
}

class Note {
  Note({this.subject, this.body});
  final String subject;
  final String body;
}

class NoteListTile extends ListTile{
  NoteListTile(Note note): super(
    title: Text(note.subject),
    subtitle: Text(note.body),
  );
}

class NotesList extends StatefulWidget{
  @override
  _NotesList createState() => _NotesList();
}

class _NotesList extends State<NotesList>{

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: AlignmentDirectional.centerEnd,
        child:  ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: allNotes?.length,
            itemBuilder: (BuildContext context, int index){
              Note note = allNotes[index];
              return NoteListTile(note);
            }
        )
    );
  }
}

class VerticalPadding extends StatelessWidget{
  VerticalPadding({
    @required this.child,
    @required this.padding,
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
}
