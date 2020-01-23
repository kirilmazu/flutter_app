import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/main.dart';

//TODO: remove it all.
class GetTestData{
  static List<ConferenceCard> getConferenceCards(){
    return myConferenceCard;
  }


  static List<Lecture> getLectureCards(){
    return lectureCards;
  }

}

class MyData{
  static bool loaded = false;

  static List<ConferenceCard> get getConferenceCards{
    return myConferenceCard;
  }


  static List<Lecture> get getLectureCards{
    return lectureCards;
  }

  static void addLecturer(Lecturer lecturer){
    lecturers.add(lecturer);
  }

  static void addConference(ConferenceCard conferenceCard) {
    myConferenceCard.add(conferenceCard);
  }

  static void addLecture(Lecture lecture) {
    lectureCards.add(lecture);
  }

  ///
  static void updateCards(){
    updateLectures();
    updateConference();

  }

  ///
  static void updateLectures(){
    for(Lecturer lecturer in lecturers){
      if(lecturer == null) continue;
      for(Lecture lecture in lectureCards){
        if(lecture == null || lecture.lectureName == null ) continue; //todo delete?
        if(lecture.lectureName == lecturer.lectureName && lecture.lecturers.contains(lecturer) != null) lecture.lecturers.add(lecturer);
      }
    }
  }

  ///
  static void updateConference(){
    for(Lecture lecture in lectureCards){
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
    //remove duplicate from lecturers

    //remove duplicate from lectures

    //remove duplicate from conferences

  }
}


//this data is for tests only.
//todo: remove it
List<ConferenceCard> myConferenceCard = [
  ConferenceCard(1,'Conference 1', 'Few words about the first conferens', 'http://placeimg.com/640/480/any', 'Some place 1', '1/1/2020',),
  ConferenceCard(3, 'Conference 2',
    'Few words about the second conferens, and this line need to be longer.',
    'http://placeimg.com/640/480/tech',
    'Some place 1', '1/1/2020',
  ),
];

List<Lecturer> lecturers1 = [
  Lecturer(
    id: 1,
    name: 'Lecturer name 1',
    company: 'Company 1',
    role: 'Role',
    //cv: 'This is the CV of this lecturer',
    main: true,
    lectureName: 'Lecturer name 1',
  ),
  Lecturer(
    id: 2,
    name: 'Lecturer name 2',
    company: 'Company 1',
    role: 'Role',
    //cv: 'This is the CV of this lecturer',
    main: false,
    lectureName: 'Lecturer name 1',
  ),
  Lecturer(
    id: 3,
    name: 'Lecturer name 3',
    company: 'Company 1',
    role: 'Role',
    //cv: 'This is the CV of this lecturer',
    main: false,
    lectureName: 'Lecturer name 1',
  ),
];

List<Lecturer> lecturers = [
Lecturer(
id: 1,
name: 'Lecturer name 1',
company: 'Company 1',
role: 'Role',
//cv: 'This is the CV of this lecturer',
main: true,
)];

List<Lecturer> lecturers2 = [
  Lecturer(
    id: 1,
    name: 'Lecturer name 1',
    company: 'Company 1',
    role: 'Role',
   //cv: 'This is the CV of this lecturer',
    main: true,
  ),
  Lecturer(
    id: 2,
    name: 'Lecturer name 2',
    company: 'Company 1',
    role: 'Role',
    //cv: 'This is the CV of this lecturer',
    main: false,
  ),
  Lecturer(
    id: 4,
    name: 'Lecturer name 4',
    company: 'Company 1',
    role: 'Role',
   // cv: 'This is the CV of this lecturer',
    main: false,
  ),
];

List<Lecture> lectureCards = [
  Lecture(
    lectureId: 1,
    startTime: "08:00",
    endTime: "09:00",
    lectureName: "Registration",
    place: "First place",
    description: "Some description",
  ),
  Lecture(
    lectureId: 2,
    startTime: "09:00",
    endTime: "11:00",
    lectureName: "Lecture 1",
    lecturers: lecturers,
    place: "Place 1",
    description:
    "Some description, and this one is a very long one, and it need to take fuul page\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nthe end\n",
  ),
  Lecture(
    lectureId: 3,
    startTime: "09:00",
    endTime: "11:00",
    lectureName: "Lecture 2",
    lecturers: lecturers2,
    place: "Place 2",
    description: "Some description",
  ),
  Lecture(
    lectureId: 4,
    startTime: "11:00",
    endTime: "13:00",
    lectureName:
    "Lecture with along name, for test long name as it can be in the academy, with a few lins",
    //lecture: "Lecture 3",
    lecturers: lecturers2,
    place: "Place 1",
    description: "Some description",
  ),
  Lecture(
    lectureId: 5,
    startTime: "13:00",
    endTime: "14:00",
    lectureName: "Lanch",
    place: "Place 3",
    description: "Some description",
  ),
  Lecture(
    lectureId: 6,
    startTime: "14:00",
    endTime: "16:00",
    lecturers: lecturers1,
    lectureName: "Lecture 4",
    place: "Place 1",
    description: "Some description",
  ),
];

List<Lecture> lectureCards2 = [
  Lecture(
    lectureId: 1,
    startTime: "08:00",
    endTime: "09:00",
    lectureName: "Registration",
    place: "First place",
    description: "Some description",
  ),
  Lecture(
    lectureId: 2,
    startTime: "09:00",
    endTime: "11:00",
    lectureName: "Lecture 1",
    lecturers: lecturers2,
    place: "Place 1",
    description:
    "Some description, and this one is a very long one, and it need to take fuul page\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nthe end\n",
  ),
  Lecture(
    lectureId: 3,
    startTime: "09:00",
    endTime: "11:00",
    lectureName: "Lecture 2",
    lecturers: lecturers2,
    place: "Place 2",
    description: "Some description",
  ),
  Lecture(
    lectureId: 4,
    startTime: "11:00",
    endTime: "13:00",
    lectureName:
    "Lecture with along name, for test long name as it can be in the academy, with a few lins",
    //lecture: "Lecture 3",
    lecturers: lecturers2,
    place: "Place 1",
    description: "Some description",
  ),
  Lecture(
    lectureId: 5,
    startTime: "13:00",
    endTime: "14:00",
    lectureName: "Lanch",
    place: "Place 3",
    description: "Some description",
  ),
  Lecture(
    lectureId: 6,
    startTime: "14:00",
    endTime: "16:00",
    lecturers: lecturers2,
    lectureName: "Lecture 4",
    place: "Place 1",
    description: "Some description",
  ),
];