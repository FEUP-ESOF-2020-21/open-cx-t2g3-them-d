/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class insertConference extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
        children: <Widget>[
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
                        MaterialPageRoute(
                            builder: (context) => insertConference());
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
          // CONTENT ROW
          Row(children: <Widget>[
            // MARGINS
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
                      "Insert Conference",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  Container(
                    child: Text(
                      "A SUBTITLE",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black26, width: 2)),
                      child: Text('SAVE',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Rubik',
                          )),
                      onPressed: () async {
                        MaterialPageRoute(
                            builder: (context) => insertConference());
                      }),
                  Container(
                    child: Text("Some normal text",
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            color: Colors.black87,
                            fontSize: 17,
                            fontWeight: FontWeight.w400)),
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
            ),
          ])
        ],
      )),
    );
  }
}*/

import 'package:flutter/material.dart';

class insertConference extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return insertConferenceState();
  }
}

class insertConferenceState extends State<insertConference> {
  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
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

  Widget _buildDistrict() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'District'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildDate() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Date'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildCategory() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Category'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'URL is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildWebsite() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Website'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Calories must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _calories = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
        children: <Widget>[
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
                        MaterialPageRoute(
                            builder: (context) => insertConference());
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
                        "InsertConference",
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
                  _buildDistrict(),
                  _buildDate(),
                  _buildCategory(),
                  _buildDescription(),
                  _buildWebsite(),
                  SizedBox(height: 100),
                  RaisedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }

                      _formKey.currentState.save();

                      print(_name);
                      print(_email);
                      print(_phoneNumber);
                      print(_url);
                      print(_password);
                      print(_calories);

                      //Send to API
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
