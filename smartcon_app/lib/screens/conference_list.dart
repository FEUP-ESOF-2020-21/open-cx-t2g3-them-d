import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:smartcon_app/services/database.dart';
import '../models/conference.dart';
import '../models/user.dart';

class ConferenceList extends StatefulWidget {
  @override
  _ConferenceListState createState() => _ConferenceListState();
}

class _ConferenceListState extends State<ConferenceList> {
  @override
  Widget build(BuildContext context) {

    final conferences = Provider.of<List<Conference>>(context) ?? [];
    List<Conference> suggestedConferences = [];
    final user = Provider.of<SmartconUser>(context);

    void setSuggestedConferences(UserData userData){
      suggestedConferences = [];
      conferences.forEach((conference) {
        if (userData.interests.contains(conference.category)) {
          suggestedConferences.add(conference);
        }
      });
    }

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          UserData userData = snapshot.data;
          setSuggestedConferences(userData);

          return ListView.builder(
            itemCount: suggestedConferences.length,
            itemBuilder: (context, index) {
              return Text(suggestedConferences[index].name);
            },
          );
        }
        else{
          print('Loading User Data');
          return Container();
        }
      }
    );
  }
}