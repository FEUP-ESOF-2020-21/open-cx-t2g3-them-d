import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'file:///C:/Users/diana/open-cx-t2g3-them-d/smartcon_app/lib/screens/conferenceSuggestions/conferenceList.dart';
import 'package:smartcon_app/models/conference.dart';
import 'package:smartcon_app/services/database.dart';

class ConferenceSuggestions extends StatefulWidget {
  @override
  ConferenceSuggestionsState createState() {
    return ConferenceSuggestionsState();
  }
}

class ConferenceSuggestionsState extends State<ConferenceSuggestions> {

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Conference>>.value(
        value: DatabaseService().conferences,
        child: ConferenceList(filterDistrict:true, ratingOrder: true, dates: [DateTime(2020,12,24), DateTime(2021,02,24)]));
  }
}
