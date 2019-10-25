import 'package:flutter/material.dart';
import 'package:flutter_app/Constants.dart';

class GetData{
  static List<ConferenceCard> getConferenceCards(){
    return myConferenceCard;
  }
}


//data for testing
List<ConferenceCard> myConferenceCard = [
  ConferenceCard(title: 'Conference 1',
    description: 'Few words about the first conferens',
    image: Image.network(
      'http://placeimg.com/640/480/any',
      width: 100,
      height: 75,
    ),
    place: 'Some place 1',
    date:  '1/1/2020',
  ),
  ConferenceCard(title: 'Conference 2',
    description: 'Few words about the second conferens, and this line need to be longer.',
    image: Image.network(
      'http://placeimg.com/640/480/any',
      width: 100,
      height: 75,
    ),
    place: 'Some place 1',
    date:  '1/1/2020',
  ),
];