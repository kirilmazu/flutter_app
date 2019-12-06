import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';


class GetTestData{
  static List<ConferenceCard> getConferenceCards(){
    return myConferenceCard;
  }
  static List<LectureCard> getLectureCards(){
    return lectureCards;
  }
  /*static List<ConferenceCard> getConferenceCards(){
    return myConferenceCard;
  }*/
}


//this data is for tests only.

List<ConferenceCard> myConferenceCard = [
  ConferenceCard(1,'Conference 1', 'Few words about the first conferens', 'http://placeimg.com/640/480/any', 'Some place 1', '1/1/2020',),
  ConferenceCard(2,'Conference 1', 'Few words about the first conferens', 'http://placeimg.com/640/480/any', 'Some place 1', '1.1.2020',),
  ConferenceCard(3, 'Conference 2',
    'Few words about the second conferens, and this line need to be longer.',
    'http://placeimg.com/640/480/any',
    'Some place 1', '1/1/2020',
  ),
];

List<Lecturer> lecturers1 = [
  Lecturer(
    id: 1,
    name: 'Lecturer name 1',
    company: 'Company 1',
    role: 'Role',
    cv: 'This is the CV of this lecturer',
    main: true,
  ),
  Lecturer(
    id: 2,
    name: 'Lecturer name 2',
    company: 'Company 1',
    role: 'Role',
    cv: 'This is the CV of this lecturer',
    main: false,
  ),
  Lecturer(
    id: 3,
    name: 'Lecturer name 3',
    company: 'Company 1',
    role: 'Role',
    cv: 'This is the CV of this lecturer',
    main: false,
  ),
];

List<Lecturer> lecturers2 = [
  Lecturer(
    id: 1,
    name: 'Lecturer name 1',
    company: 'Company 1',
    role: 'Role',
    cv: 'This is the CV of this lecturer',
    main: true,
  ),
  Lecturer(
    id: 2,
    name: 'Lecturer name 2',
    company: 'Company 1',
    role: 'Role',
    cv: 'This is the CV of this lecturer',
    main: false,
  ),
  Lecturer(
    id: 4,
    name: 'Lecturer name 4',
    company: 'Company 1',
    role: 'Role',
    cv: 'This is the CV of this lecturer',
    main: false,
  ),
];

List<LectureCard> lectureCards = [
  LectureCard(
    lectureId: 1,
    startTime: "08:00",
    endTime: "09:00",
    lecture: "Registration",
    place: "First place",
    description: "Some description",
  ),
  LectureCard(
    lectureId: 2,
    startTime: "09:00",
    endTime: "11:00",
    lecture: "Lecture 1",
    lecturers: lecturers1,
    place: "Place 1",
    description:
    "Some description, and this one is a very long one, and it need to take fuul page\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nthe end\n",
  ),
  LectureCard(
    lectureId: 3,
    startTime: "09:00",
    endTime: "11:00",
    lecture: "Lecture 2",
    lecturers: lecturers2,
    place: "Place 2",
    description: "Some description",
  ),
  LectureCard(
    lectureId: 4,
    startTime: "11:00",
    endTime: "13:00",
    lecture:
    "Lecture with along name, for test long name as it can be in the academy, with a few lins",
    //lecture: "Lecture 3",
    lecturers: lecturers2,
    place: "Place 1",
    description: "Some description",
  ),
  LectureCard(
    lectureId: 5,
    startTime: "13:00",
    endTime: "14:00",
    lecture: "Lanch",
    place: "Place 3",
    description: "Some description",
  ),
  LectureCard(
    lectureId: 6,
    startTime: "14:00",
    endTime: "16:00",
    lecturers: lecturers1,
    lecture: "Lecture 4",
    place: "Place 1",
    description: "Some description",
  ),
];

List<LectureCard> lectureCards2 = [
  LectureCard(
    lectureId: 1,
    startTime: "08:00",
    endTime: "09:00",
    lecture: "Registration",
    place: "First place",
    description: "Some description",
  ),
  LectureCard(
    lectureId: 2,
    startTime: "09:00",
    endTime: "11:00",
    lecture: "Lecture 1",
    lecturers: lecturers2,
    place: "Place 1",
    description:
    "Some description, and this one is a very long one, and it need to take fuul page\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nv\nthe end\n",
  ),
  LectureCard(
    lectureId: 3,
    startTime: "09:00",
    endTime: "11:00",
    lecture: "Lecture 2",
    lecturers: lecturers2,
    place: "Place 2",
    description: "Some description",
  ),
  LectureCard(
    lectureId: 4,
    startTime: "11:00",
    endTime: "13:00",
    lecture:
    "Lecture with along name, for test long name as it can be in the academy, with a few lins",
    //lecture: "Lecture 3",
    lecturers: lecturers2,
    place: "Place 1",
    description: "Some description",
  ),
  LectureCard(
    lectureId: 5,
    startTime: "13:00",
    endTime: "14:00",
    lecture: "Lanch",
    place: "Place 3",
    description: "Some description",
  ),
  LectureCard(
    lectureId: 6,
    startTime: "14:00",
    endTime: "16:00",
    lecturers: lecturers2,
    lecture: "Lecture 4",
    place: "Place 1",
    description: "Some description",
  ),
];