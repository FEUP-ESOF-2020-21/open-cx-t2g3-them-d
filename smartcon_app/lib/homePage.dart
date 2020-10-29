import 'package:flutter/material.dart';

class MyMainHomePage extends StatefulWidget {
  MyMainHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyMainHomePageState createState() => _MyMainHomePageState();
}

class _MyMainHomePageState extends State<MyMainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: <Widget>[
      Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset('images/homeHeader.png', fit: BoxFit.fill),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.4,
              left: MediaQuery.of(context).size.width * 0.25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "SmartCon",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.55,
              left: MediaQuery.of(context).size.width * 0.15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "Your number one Conference & Session advisor",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.2,
        ),
        child: RaisedButton(
          color: Color(0xFF7986CB),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          splashColor: Colors.green,
          highlightElevation: 20.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyMainHomePage()),
            );
          },
          child: Text(
            "Search Conferences",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
      Container(
        child: Text(
          "Already have a ticket?",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      RaisedButton(
        color: Color(0xFF7986CB),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        splashColor: Colors.green,
        highlightElevation: 20.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyMainHomePage()),
          );
        },
        child: Text(
          "Session Sugestions",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      RaisedButton(
        color: Color(0xFF7986CB),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        splashColor: Colors.green,
        highlightElevation: 20.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyMainHomePage()),
          );
        },
        child: Text(
          "Leave feedback",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      Container(
        child: Text(
          "Organizing a conference?",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      RaisedButton(
        color: Color(0xFF80CBC4),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        splashColor: Colors.green,
        highlightElevation: 20.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyMainHomePage()),
          );
        },
        child: Text(
          "Insert Conference",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    ])));
  }
}
