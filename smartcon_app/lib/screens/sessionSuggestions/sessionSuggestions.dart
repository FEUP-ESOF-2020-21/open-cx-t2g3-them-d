import 'package:flutter/material.dart';
import 'package:smartcon_app/models/session.dart';
import 'package:smartcon_app/screens/profile.dart';
import 'package:smartcon_app/services/database.dart';

class SessionSuggestions extends StatelessWidget {

  const SessionSuggestions({Key key, this.conferenceId, this.conferenceName, this.suggestedSessionIds}) : super(key: key);

  final String conferenceId;
  final String conferenceName;
  final List<String> suggestedSessionIds;

  List<Session> _getSuggestedSessions(List<Session> sessions){
    List<Session> suggested = List<Session>();
    for(int i = 0; i < sessions.length; i++){
      if(suggestedSessionIds.contains(sessions[i].sessionId))
        suggested.add(sessions[i]);
    }
    return suggested;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DatabaseService().getConferenceSessions(conferenceId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Session> sessions = _getSuggestedSessions(snapshot.data);

          return Scaffold(
            body: Column(
              children: <Widget>[
                Row(
                    children: <Widget>[
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Image.asset(
                                'images/pageHeader.png',
                                fit: BoxFit.fill
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.08,
                              top: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.08,
                            ),
                          ),
                        ],
                      ),
                    ]
                ),
                // CONTENT ROW
                Row(
                    children: <Widget>[
                      // MARGINS
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery
                              .of(context)
                              .size
                              .width * 0.08,
                          right: MediaQuery
                              .of(context)
                              .size
                              .width * 0.08,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text("A Title", style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline2,),
                              alignment: Alignment.topLeft,
                            ),
                            Container(
                              child: Text("A SUBTITLE", style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline3,),
                              alignment: Alignment.topLeft,
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Profile()),);
                              },
                              child: Text('Conference Suggestions'),
                            )
                          ],
                        ),
                      ),
                    ]
                )
              ],
            ),
          );
        }
        else {
          print('waiting for conference sesssions');
          return Container();
        }
      }
    );
  }
}