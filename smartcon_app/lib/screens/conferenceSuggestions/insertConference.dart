import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:smartcon_app/models/conference.dart';
import 'package:smartcon_app/services/auth.dart';
import 'package:smartcon_app/services/database.dart';

import '../homePage.dart';

class InsertConference extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InsertConferenceState();
  }
}

class InsertConferenceState extends State<InsertConference> {

  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name;
  String _district;
  List<DateTime> _dates = [];
  String _category;
  String _description;
  String _website;
  Conference _conference;

  String datesStr =  'Must Pick a date';
  _onDateChanged(picked){
    setState((){
      _dates = picked;
      datesStr = "FROM: " + _dates[0].toString().substring(0,10) + "\nTO: " + _dates[1].toString().substring(0,10);
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
    );

    await DatabaseService().addConference(_conference);
    Navigator.push( context, MaterialPageRoute(builder: (context) => HomePage()), );

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

  Widget _buildDistrict() {
    return DropDownFormField(
      titleText: 'District',
      hintText: 'Choose a district',
      value: _district,
      onSaved: (value) {
        setState(() {
          _district = value;
        });
      },
      onChanged: (value) {
        setState(() {
          _district = value;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please choose a district';
        }
        return null;
      },
      dataSource: [
        {
          "display": "Porto",
          "value": "Porto",
        },
        {
          "display": "Aveiro",
          "value": "Aveiro",
        },
        {
          "display": "Lisboa",
          "value": "Lisboa",
        },
        {
          "display": "Viana do Castelo",
          "value": "Viana do Castelo",
        },
        {
          "display": "Faro",
          "value": "Faro",
        },
      ],
      textField: 'display',
      valueField: 'value',
    );
  }

  Widget _buildDate() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.84,
      child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.54,
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2.0, color: Colors.black26),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),

              child: Text( datesStr, style: TextStyle(color: Colors.black87, fontSize: 15.0,  fontWeight: FontWeight.w400, fontFamily: 'Rubik',)),
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
                      final List<DateTime> picked = await DateRagePicker.showDatePicker(
                          context: context,
                          initialFirstDate: new DateTime.now(),
                          initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
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
          ]
      ),
    );
  }

  Widget _buildCategory() {
    return DropDownFormField(
      titleText: 'Category',
      hintText: 'Category',
      value: _category,
      onSaved: (value) {
        setState(() {
          _category = value;
        });
      },
      onChanged: (value) {
        setState(() {
          _category = value;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please choose a category';
        }
        return null;
      },
      dataSource: [
        {
          "display": "Technology",
          "value": "Technology",
        },
        {
          "display": "Art & Design",
          "value": "Business Conference",
        },
        {
          "display": "Cultural",
          "value": "Cultural",
        },
        {
          "display": "Finance",
          "value": "Finance",
        },
        {
          "display": "Environmental",
          "value": "Environmental",
        },
        {
          "display": "Sports",
          "value": "Sports",
        },
        {
          "display": "Literature",
          "value": "Literature",
        },
        {
          "display": "Marketing",
          "value": "Marketing",
        },
        {
          "display": "Scientific",
          "value": "Scientific",
        },
        {
          "display": "Wellness",
          "value": "Wellness",
        },
      ],
      textField: 'display',
      valueField: 'value',
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
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _description = value;
      },
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
                SizedBox(height: 15),
                _buildDate(),
                SizedBox(height: 15),
                _buildCategory(),
                SizedBox(height: 15),
                _buildDescription(),
                SizedBox(height: 15),
                _buildWebsite(),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.all(8),
                  child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black26, width: 2)),
                      child: Text('NEXT', style: TextStyle(color:Colors.black38, fontSize: 14.0,  fontWeight: FontWeight.w700, fontFamily: 'Rubik',)),
                    onPressed: () {
                      if (!_formKey.currentState.validate())
                        return;
                      _formKey.currentState.save();
                      _saveConference();
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
