import 'package:flutter_app/Constants.dart';
import 'package:flutter_app/Data.dart';

class Communication{

  static List<ConferenceCard> getConferenceCards(){
    return GetTestData.getConferenceCards();
  }
  static List<LectureCard> getLectureCards(){
    return GetTestData.getLectureCards();
  }
}