import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartcon_app/models/session.dart';
import 'package:smartcon_app/services/database.dart';
import 'package:url_launcher/url_launcher.dart';

class SessionSuggestions extends StatefulWidget {

  const SessionSuggestions({Key key, this.conferenceId, this.conferenceName, this.suggestedSessionIds}) : super(key: key);

  final String conferenceId;
  final String conferenceName;
  final List<String> suggestedSessionIds;

  @override
  _SessionSuggestionsState createState() => _SessionSuggestionsState();
}

class _SessionSuggestionsState extends State<SessionSuggestions> {
  bool _all = false;

  List<Session> _getSuggestedSessions(List<Session> sessions){
    if(_all) return sessions;
    List<Session> suggested = List<Session>();
    for(int i = 0; i < sessions.length; i++){
      if(widget.suggestedSessionIds.contains(sessions[i].sessionId))
        suggested.add(sessions[i]);
    }
    return suggested;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DatabaseService().getConferenceSessions(widget.conferenceId),
      builder: (context, snapshot) {
        print(widget.conferenceId);
        if (snapshot.hasData) {
          List<Session> sessions = _getSuggestedSessions(snapshot.data);

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  // Header - Image + Button
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

                            // Toogle See All Sessions / See Suggested Sessions
                            Padding(
                                padding:  EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.08,
                                  top: MediaQuery.of(context).size.width * 0.08,
                                ),
                                child: RaisedButton(
                                  onPressed: (){
                                    setState((){ _all = !_all; });
                                    },
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Color(0xFF6E96EF), width: 2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(!_all ? 'SEE ALL SESSIONS': 'SEE SUGGESTED SESSIONS',
                                      style: TextStyle(color: Color(0xFF6E96EF), fontSize: 14.0,  fontWeight: FontWeight.w700, fontFamily: 'Rubik',),),
                                  ),
                                  elevation: 5,
                                )
                            ),
                          ],
                        ),
                      ]
                  ),

                  // Content Row
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
                                width: MediaQuery.of(context).size.width * 0.84,
                                child: Text(widget.conferenceName, style: Theme
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

                  Row(
                    children: [
                      SessionList(sessions: sessions),
                    ],
                  )
                ],
              ),
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
                          color: Color(0xFF585858),
                          fontWeight: FontWeight.w400)),
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
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.84 - 32,
                          child: Text('Description', style: Theme.of(context).textTheme.headline3,),
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.84 - 32,
                              child: Text(session.description,
                                  style: TextStyle(
                                  fontSize: 17.0,
                                  fontFamily: 'Rubik',
                                  color: Color(0xFF585858),
                                  fontWeight: FontWeight.w400))
                            ),
                          ],
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
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(DateFormat.yMMMd().format(session.date) + ' - ' + DateFormat.Hm().format(session.date),
                          style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Rubik',
                              color: Color(0xFF585858),
                              fontWeight: FontWeight.w400)),
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
