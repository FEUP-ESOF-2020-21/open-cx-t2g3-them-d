import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartcon_app/models/session.dart';
import 'package:smartcon_app/services/database.dart';
import 'package:url_launcher/url_launcher.dart';

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
                              child: Text(conferenceName, style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline2,),
                              alignment: Alignment.topLeft,
                            ),
                            Container(
                              child: Text("SUGGESTED SESSIONS", style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline3,),
                              alignment: Alignment.topLeft,
                            ),
                          ],
                        ),
                      ),
                    ]
                ),
                SessionList(sessions: sessions)
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

class SessionList extends StatefulWidget {

  const SessionList({Key key, this.sessions}) : super(key: key);

  final List<Session> sessions;

  @override
  _SessionListState createState() => _SessionListState();
}

class _SessionListState extends State<SessionList> {
  @override
  Widget build(BuildContext context) {

    return Flexible(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.sessions.length,
        itemBuilder: (context, index) {
          return SessionTile(session: widget.sessions[index]);
        },
      ),
    );
  }
}

class SessionTile extends StatelessWidget {

  final Session session;
  SessionTile({ this.session });

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    List<Row> _listToWidgets(List<String> strList) {
      List<Row> list = [];
      for(int i = 0; i < strList.length; i++){
        list.add(
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.42 - 16,
                  child: Text(strList[i],
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Rubik',
                          color: Colors.black54,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ));
      }
      return list;
    }

    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: MediaQuery.of(context).size.width * 0.08,
        right: MediaQuery.of(context).size.width * 0.08,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, border: Border.all(width: 2.0, color: Colors.black26)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              children: <Widget>[
                Container(
                  child: Text(session.name.toUpperCase(), style: Theme.of(context).textTheme.headline5,),
                  alignment: Alignment.topLeft,
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.42 - 16,
                          child: Text('Topics', style: Theme.of(context).textTheme.headline3,),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(height: 2),
                        Column(
                          children: _listToWidgets(session.topics),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.42 - 16,
                          child: Text('Speakers', style: Theme.of(context).textTheme.headline3,),
                          alignment: Alignment.topLeft,
                        ),
                        Column(
                          children: _listToWidgets(session.speakers),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42 - 16,
                      child: Text(DateFormat.yMMMd().format(session.date) + ' - ' + DateFormat.Hm().format(session.date),
                          style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Rubik',
                              color: Colors.black54,
                              fontWeight: FontWeight.w600)),
                    ),
                    Container(
                        child: RaisedButton(
                          color: Color(0xFF6E96EF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          onPressed: () async { _launchURL(session.website);},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("MORE", style: Theme.of(context).textTheme.headline4,),
                          ),)
                    )
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }
}
