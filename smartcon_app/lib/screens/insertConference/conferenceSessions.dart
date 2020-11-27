import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcon_app/models/conference.dart';
import 'package:smartcon_app/screens/homePage.dart';
import 'package:smartcon_app/screens/insertConference/newSession.dart';
import 'package:smartcon_app/services/database.dart';

class conferenceSessions extends StatefulWidget {
  conferenceSessions({Key key}) : super(key: key);

  @override
  _conferenceSessions createState() => _conferenceSessions();
}

class _conferenceSessions extends State<conferenceSessions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
          // HEADER IMAGE (100%)
          Row(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('images/pageHeader.png', fit: BoxFit.fill),
            ),
          ]),

          // CONTENT ROW
          Row(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.08,
                right: MediaQuery.of(context).size.width * 0.08,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Page title
                    Container(
                      child: Text(
                        "Conference Sessions",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      alignment: Alignment.topLeft,
                    ),

                    //Manage Profile Button
                    SizedBox(height: 10),
                    RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black26, width: 2)),
                      highlightElevation: 40.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => newSession()),
                        );
                      },
                      child: Text("ADD SESSION",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Rubik',
                          )),
                    ),
                    //Manage Profile Button
                    SizedBox(height: 450),
                    RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black26, width: 2)),
                      highlightElevation: 40.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Text("DONE",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Rubik',
                          )),
                    ),
                  ]),
            )
          ])
        ]),
      ),
    );
  }
}
