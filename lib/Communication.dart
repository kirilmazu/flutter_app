import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/Data.dart';
import 'dart:async';
import 'package:mysql1/mysql1.dart';


class Communication{

  static List<ConferenceCard> getConferenceCards(){
    return GetTestData.getConferenceCards();
  }


  static List<Lecture> getLectureCards(){
    return GetTestData.getLectureCards();
  }

  static Future<void> registerToConference(String conferenceName) async {
    User user = currentUser;
    //todo implement


  }

  static void registerToLecture(int lectureID){
    User user = currentUser;
  }
}

class DataBaseCommunication{
  static Future<MySqlConnection> get connection async {
    String host = "mysql5005.site4now.net";
    String dataBase = "db_a5095c_webconf";
    String userName = "a5095c_webconf";
    String pass = "0505690866A.";
    int port = 3306;

    final connection = await MySqlConnection.connect(new ConnectionSettings(
      host: host,
      port: port,
      user: userName,
      password: pass,
      db: dataBase,
    ));

    return connection;
  }

  static Future<Results>  runQuery(String myQuery) async {
    var myConnection = await connection;
    //run the query
    var results = await myConnection.query(myQuery);
    //close the connection
    await myConnection.close();
    //return mysql1.Results (list of fields)
    return results;
  }

  static Future<List<ConferenceCard>> loadData(bool loadAll) async {
    final res = await loadLecturers();
    final res2 = await loadLecture();
    final res3 = await loadConference(loadAll);
    return Communication.getConferenceCards();
  }


  ///Load Conference from the server database
  static Future<bool> loadConference(bool loadAll) async{//get all conferences
    String publish = loadAll ? "" : " where publish = 1";
    String myQuery = "select * from "  + DataBaseConstant.conferenceTableName + publish;
    Results results = await DataBaseCommunication.runQuery(myQuery);
    ConferenceCard conferenceCard;
    for(var row in results) {
      conferenceCard = new ConferenceCard(0, row[DataBaseConstant.conferenceNameColumn],
        row[DataBaseConstant.conferenceDescriptionColumn],
        row[DataBaseConstant.conferenceImageColumn],
        row[DataBaseConstant.conferenceLocationColumn],
        row[DataBaseConstant.conferenceDateColumn],
      );
      MyData.addConference(conferenceCard);
    }
    MyData.updateConference();
    return true;
  }

  ///Load Lecture from the server database
  static Future<bool> loadLecture() async {//get all lectures
    String myQuery = "select * from " + DataBaseConstant.lectureTableName;
    Results results = await DataBaseCommunication.runQuery(myQuery);
    Lecture lecture;
    for(var row in results) {
      lecture = new Lecture(
        lectureId: 1,
        conferenceName: row[DataBaseConstant.lectureConferenceNameColumn],
        lectureName: row[DataBaseConstant.lectureNameColumn],
        startTime: row[DataBaseConstant.lectureStartColumn],
        endTime: row[DataBaseConstant.lectureEndColumn],
        place: row[DataBaseConstant.lectureLocationColumn],
        description: row[DataBaseConstant.lectureDescriptionColumn],
        file: row[DataBaseConstant.lectureFileColumn],
        lecturers: [],
      );
      MyData.addLecture(lecture);
    }
    MyData.updateLectures();
    return true;
  }

  ///Load Lecturers from the server database
  static Future<bool> loadLecturers() async {//get all lecturers
    String myQuery = "select * from " + DataBaseConstant.lecturerTableName;
    Results results = await DataBaseCommunication.runQuery(myQuery);
    Lecturer lecturer;
    Image image;
    for(var row in results){
      //todo fix image
      /*if(row[DataBaseConstant.lecturerImageColumn] != null) {//check image
        try {
          image = Image.network(
            row[DataBaseConstant.lecturerImageColumn],
            width: imageW,
            height: imageH,
          );
        } on Exception catch (exception) {
          image = Image.asset(defaultImage, width: imageW, height: imageH,);
        }
      }else image = Image.asset(defaultImage, width: imageW, height: imageH,);*/
      image = Image.asset(defaultImage, width: imageW, height: imageH,);
      //get Lecture
      lecturer = new Lecturer(
          id: 1,
          name: row[DataBaseConstant.lecturerNameColumn],
          company: row[DataBaseConstant.lecturerCompanyColumn],
          role: row[DataBaseConstant.lecturerRoleColumn],
          cv: row[DataBaseConstant.lecturerCVColumn],
          main: row[DataBaseConstant.lecturerIsLectureColumn] == 1 ? true:false,
          image: image,
          lectureName: row[DataBaseConstant.lecturerLectureNameColumn],
          imageUrl:  row[DataBaseConstant.lecturerImageColumn],
      );
      MyData.addLecturer(lecturer);
    }
    return true;
  }
/*
  static Future<void> insertUser(User user) async{
    var myConnection = await connection;
    //insert the user
    var results = await myConnection.query("insert inte " + DataBaseConstant.userTableName
        + "(FullName, Company, Role, Email) values (?, ?, ?, ?)", [user.fullName, user.company, user.role, user.email]);

    //close the connection
    await myConnection.close();
  }

  static Future<void> insertParticipants(User user, String conferenceName) async{
    var myConnection = await connection;
    //insert the user
    var results = await myConnection.query("insert inte " + DataBaseConstant.participantsTableName
        + "(FullName, Company, Role, Email) values (?, ?, ?, ?)", [user.email, conferenceName]);

    //close the connection
    await myConnection.close();
  }*/

}
