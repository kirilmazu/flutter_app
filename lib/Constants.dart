import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

User currentUser;

class Constants{
  static bool darkTeam = true;

  static const String Register = 'Regester';
  static const String About = 'About';
  static const String Notes = 'Notes';
  static const String Tests = 'Tests';

  static const List<String> choices = <String>[Register, Notes, About, Tests];
}

const bool darkTeam = true;
const double imageW = 100;
const double imageH = 75;
const String defaultImage = 'images/kinneretLogo.jpg';

class ConferenceCard{
  final int    conferenceID;
  final String title;       //conference name
  final String description;
  final Image image;
  final String place;      //location
  final String date;
  final String imageUrl;
  final List<Lecture> lectures;
  final List<Lecture> parallelLecture;

  ConferenceCard(int conferenceID, String title, String description, String image, String place, String date):
    this.conferenceID = conferenceID,
    this.title = title,
    this.description =description,
    this.image = imageByUrl(image),
    this.imageUrl = image,
    this.place = place,
    this.date = date,
    this.lectures = [],
    this.parallelLecture = [];

    //TODO: add lecture list

  static Image imageByUrl(String url){
    try {
      final image = Image.network(
        url,
        width: imageW,
        height: imageH,
      );
      return image;
    }on Exception catch(exception){
      return Image.asset('images/kinneretLogo.jpg', width: imageW, height: imageH,);
    }
  }
}

class Lecture{
  Lecture({this.conferenceName, this.lectureName, this.lectureId, this.startTime, this.endTime, this.lecture, this.lecturers, this.place, this.description, this.file});
  final String lectureName;
  final int lectureId;
  final String startTime;
  final String endTime;
  final String lecture;    //lecture name
  final List<Lecturer> lecturers;
  final String place;      //class
  final String description;
  final String file;
  final String conferenceName;
}

class Day{
  Day({this.dayName, this.lectureCards});
  final String dayName;
  final List<Lecture> lectureCards;
}

class Lecturer{
  Lecturer({this.id, this.name, this.company, this.cv, this.role, this.main, this.image, this.lectureName, this.imageUrl});
  final int id;
  final String name;
  final String company;
  final String cv;
  final String role;
  final bool main; //is it main lecturer
  final Image image;
  final String lectureName;
  final String imageUrl;
}

class User{
  User({this.id, this.fullName, this.company, this.role, this.email});
  final int id;
  final String email;
  final String fullName;
  final String company;
  final String role;
}


class Storage{
  Future<String> get localPath async{
    final dir = await getApplicationDocumentsDirectory();
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

}

class Data{

}

///table names and columns numbers to get data from the database
class DataBaseConstant{
  //conference
  static const String conferenceTableName = "tblconference";
  static const int conferenceNameColumn = 0;
  static const int conferenceLocationColumn = 1;
  static const int conferenceDateColumn = 2;
  static const int conferenceDescriptionColumn = 3;
  static const int conferencePublishColumn = 5;
  static const int conferenceImageColumn = 6;
  //Lecturer
  static const String lecturerTableName = "tblauthors";
  static const int lecturerNameColumn = 0;
  static const int lecturerCompanyColumn = 1;
  static const int lecturerRoleColumn = 2;
  static const int lecturerCVColumn = 3;
  static const int lecturerIsLectureColumn = 4;
  static const int lecturerImageColumn = 5;
  static const int lecturerLectureNameColumn = 6;
  //Lecture
  static const String lectureTableName = "tbllecture";
  static const int lectureNameColumn = 0;
  static const int lectureStartColumn = 1;
  static const int lectureEndColumn = 2;
  static const int lectureDescriptionColumn = 3;
  static const int lectureLocationColumn = 4;
  static const int lectureFileColumn = 5;
  static const int lectureConferenceNameColumn = 6;
}