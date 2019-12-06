import 'package:flutter/material.dart';

User currentUser;

class Constants{
  static bool darkTeam = true;

  static Brightness brightness =  darkTeam ? Brightness.dark : Brightness.light;


  static const String Settings = 'Settings';
  static const String LogIn = 'LogIn';
  static const String LogOut = 'LogOut';
  static const String About = 'About';
  static const String Notes = 'Notes';

  static const List<String> choices = <String>[Settings, Notes, About, LogIn];

}

const bool darkTeam = true;
const double imageW = 100;
const double imageH = 75;

class ConferenceCard{
  final int    conferenceID;
  final String title;       //conference name
  final String description;
  final Image image;
  final String place;      //location
  final String date;

  ConferenceCard(int conferenceID, String title, String description, String image, String place, String date):
    this.conferenceID = conferenceID,
    this.title = title,
    this.description =description,
    this.image = imageByUrl(image),
    this.place = place,
    this.date = date;


  static Image imageByUrl(String url){
    final image = Image.network(
      url,
      width: imageW,
      height: imageH,
    );
    return image;
  }
}

class LectureCard{
  LectureCard({this.lectureId, this.startTime, this.endTime, this.lecture, this.lecturers, this.place, this.description});
  final int lectureId;
  final String startTime;
  final String endTime;
  final String lecture;    //lecture name
  final List<Lecturer> lecturers;
  final String place;      //class
  final String description;
}

class Day{
  Day({this.dayName, this.lectureCards});
  final String dayName;
  final List<LectureCard> lectureCards;
}

class Lecturer{
  Lecturer({this.id, this.name, this.company, this.cv, this.role, this.main});
  final int id;
  final String name;
  final String company;
  final String cv;
  final String role;
  final bool main; //is it main lecturer
}

class User{
  User({this.id, this.fullName, this.company, this.role, this.email});
  final int id;
  final String email;
  final String fullName;
  final String company;
  final String role;
}
