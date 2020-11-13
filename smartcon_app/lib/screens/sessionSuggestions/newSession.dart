import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:smartcon_app/models/conference.dart';
import 'package:smartcon_app/models/session.dart';
import 'package:smartcon_app/screens/sessionSuggestions/conferenceSessions.dart';
import 'package:smartcon_app/services/auth.dart';
import 'package:smartcon_app/services/database.dart';
import 'package:time_range/time_range.dart';

import '../homePage.dart';

class insertTopics extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _insertTopics();
  }
}

class _insertTopics extends State<insertTopics> {
  String _topic1;
  String _topic2;
  String _topic3;
  String _topic4;
  String _topic5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      body: Column(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset('images/pageHeader.png', fit: BoxFit.fill),
        ),
        SizedBox(height: 50),
        Container(
          child: Text(
            "Insert Topics",
            style: Theme.of(context).textTheme.headline5,
          ),
          alignment: Alignment.topCenter,
        ),
        SizedBox(height: 50),
        TextFormField(
          decoration: new InputDecoration(
            labelText: "Topic 1",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: new BorderSide(),
            ),
          ),
          maxLength: 10,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Name is Required';
            }

            return null;
          },
          onSaved: (String value) {
            _topic1 = value;
          },
        ),
        Container(
          child: TextFormField(
            decoration: new InputDecoration(
              labelText: "Topic 2",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: new BorderSide(),
              ),
            ),
            maxLength: 10,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Name is Required';
              }

              return null;
            },
            onSaved: (String value) {
              _topic2 = value;
            },
          ),
        ),
        Container(
          child: TextFormField(
            decoration: new InputDecoration(
              labelText: "Topic 3",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: new BorderSide(),
              ),
            ),
            maxLength: 10,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Name is Required';
              }

              return null;
            },
            onSaved: (String value) {
              _topic3 = value;
            },
          ),
        ),
        Container(
          child: TextFormField(
            decoration: new InputDecoration(
              labelText: "Topic 4",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: new BorderSide(),
              ),
            ),
            maxLength: 10,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Name is Required';
              }

              return null;
            },
            onSaved: (String value) {
              _topic4 = value;
            },
          ),
        ),
        Container(
          child: TextFormField(
            decoration: new InputDecoration(
              labelText: "Topic 5",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: new BorderSide(),
              ),
            ),
            maxLength: 10,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Name is Required';
              }

              return null;
            },
            onSaved: (String value) {
              _topic5 = value;
            },
          ),
        ),
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
          child: Text("  DONE  ",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Rubik',
              )),
        ),
      ]),
    );
  }
}

class insertSpeakers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _insertSpeakers();
  }
}

class _insertSpeakers extends State<insertSpeakers> {
  String _speaker1;
  String _speaker2;
  String _speaker3;
  String _speaker4;
  String _speaker5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      body: Column(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset('images/pageHeader.png', fit: BoxFit.fill),
        ),
        SizedBox(height: 50),
        Container(
          child: Text(
            "Insert Speakers",
            style: Theme.of(context).textTheme.headline5,
          ),
          alignment: Alignment.topCenter,
        ),
        SizedBox(height: 50),
        TextFormField(
          decoration: new InputDecoration(
            labelText: "Speaker 1",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: new BorderSide(),
            ),
          ),
          maxLength: 10,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Name is Required';
            }

            return null;
          },
          onSaved: (String value) {
            _speaker1 = value;
          },
        ),
        Container(
          child: TextFormField(
            decoration: new InputDecoration(
              labelText: "Speaker 2",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: new BorderSide(),
              ),
            ),
            maxLength: 10,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Name is Required';
              }

              return null;
            },
            onSaved: (String value) {
              _speaker2 = value;
            },
          ),
        ),
        Container(
          child: TextFormField(
            decoration: new InputDecoration(
              labelText: "Speaker 3",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: new BorderSide(),
              ),
            ),
            maxLength: 10,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Name is Required';
              }

              return null;
            },
            onSaved: (String value) {
              _speaker3 = value;
            },
          ),
        ),
        Container(
          child: TextFormField(
            decoration: new InputDecoration(
              labelText: "Speaker 4",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: new BorderSide(),
              ),
            ),
            maxLength: 10,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Name is Required';
              }

              return null;
            },
            onSaved: (String value) {
              _speaker4 = value;
            },
          ),
        ),
        Container(
          child: TextFormField(
            decoration: new InputDecoration(
              labelText: "Speaker 5",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: new BorderSide(),
              ),
            ),
            maxLength: 10,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Name is Required';
              }

              return null;
            },
            onSaved: (String value) {
              _speaker5 = value;
            },
          ),
        ),
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
          child: Text("  DONE  ",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Rubik',
              )),
        ),
      ]),
    );
  }
}

class newSession extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _newSession();
  }
}

class _newSession extends State<newSession> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name;
  String _district;
  List<DateTime> _dates = [];
  String _category;
  String _description;
  String _website;
  Conference _conference;
  List<Session> _sessions;

  String datesStr = 'Must Pick a date';
  _onDateChanged(picked) {
    setState(() {
      _dates = picked;
      datesStr = "FROM: " +
          _dates[0].toString().substring(0, 10) +
          "\nTO: " +
          _dates[1].toString().substring(0, 10);
    });
  }

  _saveConference() async {
    _conference = new Conference(
        name: _name,
        category: _category,
        district: _district,
        website: _website,
        description: _description,
        beginDate: _dates[0],
        endDate: _dates[0],
        rating: 0,
        sessions: _sessions);

    await DatabaseService().addConference(_conference);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  Widget _buildName() {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "Name",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: new BorderSide(),
        ),
      ),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildTopics() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.84,
      child: Row(children: <Widget>[
        RaisedButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.black26, width: 2)),
          highlightElevation: 40.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => insertTopics()),
            );
          },
          child: Text(
              "                            INSERT TOPICS                            ",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Rubik',
              )),
        ),
      ]
          //Manage Profile Button
          ),
    );
  }

  Widget _buildSpeakers() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.84,
      child: Row(children: <Widget>[
        RaisedButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.black26, width: 2)),
          highlightElevation: 40.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => insertSpeakers()),
            );
          },
          child: Text(
              "                         INSERT SPEAKERS                        ",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Rubik',
              )),
        ),
      ]
          //Manage Profile Button
          ),
    );
  }

  Widget _buildDate() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.84,
      child: Row(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.54,
          height: 50.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2.0, color: Colors.black26),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Text(datesStr,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Rubik',
              )),
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: ButtonTheme(
            height: 50,
            child: MaterialButton(
                color: Color(0xFF6E96EF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                highlightElevation: 40.0,
                onPressed: () async {
                  final List<DateTime> picked =
                      await DateRagePicker.showDatePicker(
                    context: context,
                    initialFirstDate: new DateTime.now(),
                    initialLastDate:
                        (new DateTime.now()).add(new Duration(days: 7)),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2222),
                  );
                  if (picked != null && picked.length == 2) {
                    print(picked);
                    _onDateChanged(picked);
                  }
                },
                child: Text(
                  "Date",
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                )),
          ),
        ),
      ]),
    );
  }

  Widget _buildWebsite() {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "Website",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: new BorderSide(),
        ),
      ),
      keyboardType: TextInputType.number,
      validator: (String value) {},
      onSaved: (String value) {
        _website = value;
      },
    );
  }

  Widget _buildHour() {
    return Row(children: <Widget>[
      Flexible(
          child: TimeRange(
        fromTitle: Text(
          'From',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6E96EF)),
        ),
        toTitle: Text(
          'To',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6E96EF)),
        ),
        titlePadding: 20,
        textStyle:
            TextStyle(fontWeight: FontWeight.normal, color: Colors.black87),
        activeTextStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        borderColor: Colors.grey,
        backgroundColor: Colors.transparent,
        activeBackgroundColor: Colors.grey,
        firstTime: TimeOfDay(hour: 1, minute: 30),
        lastTime: TimeOfDay(hour: 20, minute: 00),
        timeStep: 10,
        timeBlock: 30,
        onRangeCompleted: (range) => setState(() => print(range)),
      ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(children: <Widget>[
        Row(children: <Widget>[
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('images/pageHeader.png', fit: BoxFit.fill),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.08,
                    top: MediaQuery.of(context).size.width * 0.08,
                  ),
                  child: RaisedButton(
                    onPressed: () async {
                      await _auth.signOutGoogle();
                    },
                    color: Color(0xFF6E96EF),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "SIGN OUT",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  )),
            ],
          ),
        ]),
        Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.08,
              right: MediaQuery.of(context).size.width * 0.08,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "New Session",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    alignment: Alignment.topLeft,
                  )
                ])),
        // CONTENT ROW
        Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildTopics(),
                SizedBox(height: 15),
                _buildSpeakers(),
                SizedBox(height: 15),
                _buildWebsite(),
                SizedBox(height: 15),
                _buildDate(),
                SizedBox(height: 15),
                _buildHour(),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.all(8),
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.black26, width: 2)),
                    child: Text('NEXT',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Rubik',
                        )),
                    onPressed: () {
                      if (!_formKey.currentState.validate()) return;
                      /*  _formKey.currentState.save();
                      _saveConference();*/
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => conferenceSessions()),
                      );
                      //Send to API
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ])),
    );
  }
}
