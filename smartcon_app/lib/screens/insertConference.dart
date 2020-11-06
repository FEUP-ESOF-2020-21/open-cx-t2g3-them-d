import 'package:flutter/material.dart';

import 'package:dropdown_formfield/dropdown_formfield.dart';

class insertConference extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return insertConferenceState();
  }
}

class insertConferenceState extends State<insertConference> {
  String _name;
  String _district;
  String _dateTime;
  String _category;
  String _description;
  String _website;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      hintText: 'Choose a district',
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
    return Stack(children: [
      MaterialButton(
          minWidth: 100,
          color: Colors.blueGrey[50],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: () async {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2222))
                .then((date) {
              setState(() {
                _dateTime = date.toString();
              });
            });
          },
          child: Text(
            "Date",
            textAlign: TextAlign.center,
          )),
      Container(
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(10.0),
            border: Border.all(width: 0.5)),
        width: 345.0,
        height: 40.0,
        child: Text(
            _dateTime == null ? 'Must Pick a date' : _dateTime.substring(0, 10),
            textAlign: TextAlign.center),
        alignment: Alignment.center,
      ),
    ]);
  }

  Widget _buildCategory() {
    return DropDownFormField(
      hintText: 'Categoty',
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
          "display": "Academic Conference",
          "value": "Academic Conference",
        },
        {
          "display": "Business Conference",
          "value": "Business Conference",
        },
        {
          "display": "Cultural Conference",
          "value": "Cultural Conference",
        },
        {
          "display": "Diplomatic Conference",
          "value": "Diplomatic Conference",
        },
        {
          "display": "Environmental Conference",
          "value": "Environmental Conference",
        },
        {
          "display": "Journalism Conference",
          "value": "Journalism Conference",
        },
        {
          "display": "Technology Conference",
          "value": "Technology Conference",
        },
        {
          "display": "Music Conference",
          "value": "Music Conference",
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
      body: Center(
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
                SizedBox(height: 15),
                _buildDate(),
                SizedBox(height: 15),
                _buildCategory(),
                SizedBox(height: 15),
                _buildDescription(),
                SizedBox(height: 15),
                _buildWebsite(),
                SizedBox(height: 15),
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
                    print(_district);
                    print(_category);
                    print(_description);
                    print(_dateTime);
                    print(_website);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ])),
    );
  }
}
