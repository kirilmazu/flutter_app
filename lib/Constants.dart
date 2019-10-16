import 'package:flutter/material.dart';

class Constants{
  static const String Settings = 'Settings';
  static const String LogIn = 'LogIn';
  static const String LogOut = 'LogOut';
  static const String About = 'About';
  static const String Conferences = 'Conferences';
  static const String Notes = 'Notes';

  static const List<String> choices = <String>[Settings, Conferences, Notes, About, LogIn];

}

class myCard{
  myCard({this.title, this.description, this.image, this.place, this.date});
  final String title;
  final String description;
  final Image image;
  final String place;
  final String date;
}

class LectureCard{
  LectureCard({this.lectureId, this.startTime, this.endTime, this.lecture, this.lecturer, this.place, this.description});
  final int lectureId;
  final String startTime;
  final String endTime;
  final String lecture;
  final Lecturer lecturer;
  final String place;
  final String description;
}

class Day{
  Day({this.dayName, this.lectureCards});
  final String dayName;
  final List<LectureCard> lectureCards;
}

class Lecturer{
  Lecturer({this.name,});
  final String name;
}
