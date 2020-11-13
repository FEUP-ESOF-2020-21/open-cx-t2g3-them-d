import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcon_app/models/conference.dart';
import 'package:smartcon_app/screens/homePage.dart';
import 'package:smartcon_app/screens/sessionSuggestions/newSession.dart';
import 'package:smartcon_app/screens/sessionSuggestions/conferenceSessions.dart';
import 'package:smartcon_app/services/database.dart';

class sessionQuestion extends StatefulWidget {
  sessionQuestion({Key key}) : super(key: key);

  @override
  _sessionQuestion createState() => _sessionQuestion();
}

class _sessionQuestion extends State<sessionQuestion> {
  String _question;
  String _answerA;
  String _answerB;
  String _answerC;
  String _answerD;

  Widget _buildQuestion() {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "Question",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _question = value;
      },
    );
  }

  Widget _buildAnswerA() {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "Option",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _answerA = value;
      },
    );
  }

  Widget _buildAnswerB() {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "Option",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _answerB = value;
      },
    );
  }

  Widget _buildAnswerC() {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "Option",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _answerC = value;
      },
    );
  }

  Widget _buildAnswerD() {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "Option",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _answerD = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Conference>>.value(
      value: DatabaseService().conferences,
      child: Scaffold(
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // HEADER IMAGE (100%)
                Row(children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child:
                        Image.asset('images/pageHeader.png', fit: BoxFit.fill),
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
                              "Session Question",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Text(
                              "Make a Question to test Attendees knowledge",
                              style: TextStyle(
                                color: Color(0xFF4A4444),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),

                          //Manage Profile Button
                        ]),
                  ),
                ]),
                Container(
                    margin: EdgeInsets.all(26),
                    child: Form(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "QUESTION",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            SizedBox(height: 10),
                            _buildQuestion(),
                            SizedBox(height: 10),
                            Container(
                              child: Text(
                                "KNOLDGE REQUIRED ",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Text(
                                "A.",
                                style: TextStyle(
                                  color: Color(0xFF637DEB),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            _buildAnswerA(),
                            Container(
                              child: Text(
                                "B.",
                                style: TextStyle(
                                  color: Color(0xFF637DEB),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            _buildAnswerB(),
                            Container(
                              child: Text(
                                "C.",
                                style: TextStyle(
                                  color: Color(0xFF637DEB),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            _buildAnswerC(),
                            Container(
                              child: Text(
                                "D.",
                                style: TextStyle(
                                  color: Color(0xFF637DEB),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            _buildAnswerD(),
                          ]),
                    )),
                Row(children: <Widget>[
                  SizedBox(width: 25),
                  RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.black26, width: 2)),
                    highlightElevation: 40.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => newSession()),
                      );
                    },
                    child: Text("BACK",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Rubik',
                        )),
                  ),
                  SizedBox(width: 130),
                  RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.black26, width: 2)),
                    highlightElevation: 40.0,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => conferenceSessions()),
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
                ]),
              ]),
        ),
      ),
    );
  }
}
