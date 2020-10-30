import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcon_app/screens/conference_list.dart';
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
        child: ConferenceList());
  }
}
