import 'package:flutter_app/Constants.dart';

class MyData{
  static List<ConferenceCard> get getConferenceCards{
    return myConferenceCard;
  }

  static List<Lecture> get getLectureCards{
    return myLectureCards;
  }

  static List<Lecturer> get getLecturers{
    return myLecturers;
  }

  static void addLecturer(Lecturer lecturer){
    myLecturers.add(lecturer);
  }

  static void addConference(ConferenceCard conferenceCard) {
    myConferenceCard.add(conferenceCard);
  }

  static void addLecture(Lecture lecture) {
    myLectureCards.add(lecture);
  }

  ///populate the lectures and conference
  static void updateCards(){
    updateLectures();
    updateConference();
  }

  ///populate the lectures with lecturers
  static void updateLectures(){
    for(Lecture lecture in myLectureCards){
      if(lecture == null || lecture.lectureName == null ) continue;
      for(Lecturer lecturer in myLecturers) {
        if (lecturer == null) continue;
        else if(lecture.lectureName == lecturer.lectureName)
          lecture.lecturers.add(lecturer);
      }
    }
  }

  ///populate the conference with lectures
  static void updateConference(){
    for(Lecture lecture in myLectureCards){
      for(ConferenceCard conferenceCard in myConferenceCard){
        if(lecture.conferenceName == conferenceCard.title){
          if(!conferenceCard.lectures.contains(lecture)){
            for(Lecture conLecture in conferenceCard.lectures){
              if(conLecture.startTime == lecture.startTime){
                conferenceCard.parallelLectures.add(lecture);
                break;
              }
            }
            if(!conferenceCard.lectures.contains(lecture) && !conferenceCard.parallelLectures.contains(lecture)) conferenceCard.lectures.add(lecture);
          }
        }
      }
    }
  }//updateConference

  static void removeDuplicate(){
    //todo: implement or remove
    //remove duplicate from lecturers

    //remove duplicate from lectures

    //remove duplicate from conferences

  }

  static void toggleAddToPlanerStatus(ConferenceCard conferenceCard){
    for(ConferenceCard conCard in myConferenceCard){
      if(conCard.title == conferenceCard.title) {
        conCard.userAddToPlaner = !conCard.userAddToPlaner;
        return;
      }
    }
  }


  static String get myDataToString{
    String dataString = "";
    for(ConferenceCard conferenceCard in myConferenceCard){
      //todo: implement
    }
    for(Lecture lecture in myLectureCards){
      //todo: implement
    }
    for(Lecturer lecturer in myLecturers){
      //todo: implement
    }
    return dataString;
  }

  static void myDataFromString(String myDataString){
    //todo: implement
  }
}

///object to store the conferences
List<ConferenceCard> myConferenceCard = [];
///object to store the lecturers data
List<Lecturer> myLecturers = [];
///object to store the lectures data
List<Lecture> myLectureCards = [];