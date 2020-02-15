import 'package:flutter_app/Communication.dart';
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

  static void addParticipants(String participantsInConference){
    myParticipants.add(participantsInConference);
  }

  static List<String> get getMyParticipants{
    return myParticipants;
  }

  static void updateParticipants(){
    if(currentUser == null) return;
    DataBaseCommunication.loadParticipants().then((onValue){
      for(String parConf in myParticipants){
        for(ConferenceCard card in myConferenceCard){
          if(parConf == card.title)card.userAddToPlaner = true;
        }
      }
    });
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

  ///remove duplicate from all
  static void removeDuplicate(){
    int count = 0;
    //remove duplicate conferenceCard
    for(ConferenceCard conferenceCard in myConferenceCard){
      count = 0;
      for(ConferenceCard con in myConferenceCard){
        if(con == conferenceCard) count++;
      }
      if(count>1) myConferenceCard.remove(conferenceCard);
    }
    //remove duplicate lectures
    for(Lecture lecture in myLectureCards){
      count = 0;
      for(Lecture lect in myLectureCards){
        if(lect == lecture) count++;
      }
      if(count>1) myLectureCards.remove(lecture);
    }
    //remove duplicate lecturers
    for(Lecturer lecturer in myLecturers){
      count = 0;
      for(Lecturer lecturerTemp in myLecturers){
        if(lecturer == lecturerTemp) count++;
      }
      if(count>1) myLecturers.remove(lecturer);
    }
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

    }
    //remove duplicate lectures
    for(Lecture lecture in myLectureCards){

    }
    //remove duplicate lecturers
    for(Lecturer lecturer in myLecturers){

    }
    return dataString;
  }

  static DateTime dataTimeFromString(String dataString, String timeString) {
    return DateTime.parse(dataString + " " + timeString + ":00");
  }
}
//todo: move it
///object to store the conferences
List<ConferenceCard> myConferenceCard = [];
///object to store the lecturers data
List<Lecturer> myLecturers = [];
///object to store the lectures data
List<Lecture> myLectureCards = [];
///The conference the user register for
List<String> myParticipants = [];
///The registered user
User currentUser;