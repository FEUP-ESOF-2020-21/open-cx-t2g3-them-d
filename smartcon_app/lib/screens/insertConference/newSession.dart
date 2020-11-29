import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:smartcon_app/models/conference.dart';
import 'package:smartcon_app/models/session.dart';
import 'package:time_range/time_range.dart';
import 'package:smartcon_app/screens/insertConference/sessionQuestion.dart';
import 'package:smartcon_app/screens/insertConference/insertSpeakers.dart';

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
              MaterialPageRoute(builder: (context) => NewSession()),
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
    );
  }
}

class NewSession extends StatefulWidget {
  Session session = Session.emptySession();
  final state = _NewSessionState();

  @override
  _NewSessionState createState() => state;

  bool isValid() => state.validate();
}

class _NewSessionState extends State<NewSession> {

  final GlobalKey<FormState> _sessionFormKey = GlobalKey<FormState>();

  String _name;
  DateTime _date;
  String dateStr = 'Must Pick a date';
  String _description;
  String _website;
  List<String> _speakers = new List<String>();

  _buildSession(){
    widget.session = new Session(
        name: _name,
        speakers: _speakers,
        /*topics: _topics, hour??*/
        website: _website,
        description: _description,
        date: _date,);
  }

  String datesStr = 'Must Pick a date';
  _onDateChanged(picked) {
    setState(() {
      _date = picked;
      dateStr = _date.toString().substring(0, 10);
    });
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
      maxLength: 50,
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
    return Row(children: <Widget>[
      ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.84,
        child: RaisedButton(
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
              "INSERT TOPICS",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Rubik',
              )),
        ),
      ),
    ]
        //Manage Profile Button
        );
  }

  Widget _buildSpeakers() {
    return Row(
      children: [
        ButtonTheme(
          minWidth: MediaQuery.of(context).size.width * 0.84,
          child: MaterialButton(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black26, width: 2)),
            highlightElevation: 40.0,
            onPressed: () async {
              var receivedSpeakers = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InsertSpeakers(speakers: _speakers,)),
              );
              if(receivedSpeakers != null) _speakers = receivedSpeakers;
            },
            child: Text(
                "INSERT SPEAKERS",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Rubik',
                )),
          ),
        ),
      ],
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
          child: Text(dateStr,
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
                  final DateTime picked =
                      await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2222),
                  );
                  if (picked != null && picked != _date) {
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
      keyboardType: TextInputType.url,
      validator: (String value) {},
      onSaved: (String value) {
        _website = value;
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "Description",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: new BorderSide(),
        ),
      ),
      keyboardType: TextInputType.text,
      validator: (String value) {

      },
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
            // HEADER
            Row(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('images/pageHeader.png', fit: BoxFit.fill),
              ),
            ]),

          // Title
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
              key: _sessionFormKey,
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
                  _buildDescription(),
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
                      onPressed: onSave,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ])),
    );
  }

  // form validator
  bool validate() {
    var valid = _sessionFormKey.currentState.validate();
    if (valid) _sessionFormKey.currentState.save();
    return valid;
  }

  //on save forms
  void onSave() {
    if (_sessionFormKey.currentState.validate() && _speakers.length != 0) {
      Navigator.pop(context, widget.session);
    }
  }

}
