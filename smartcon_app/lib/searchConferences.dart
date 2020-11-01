import 'package:flutter/material.dart';

import 'main.dart';

class SearchConferences extends StatefulWidget {
  SearchConferences({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchConferences createState() => _SearchConferences();
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchConferences extends State<SearchConferences> {
  DateTime _dateTime;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        children: <Widget>[
          // HEADER IMAGE (100%)
          Row(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('images/pageHeader.png', fit: BoxFit.fill),
            ),
          ]),
          // CONTENT ROW
          Row(children: <Widget>[
            // MARGINS
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.04,
                left: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Search Conferences",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.04,
                      left: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * 0.4,
                      child: RaisedButton(
                        color: Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        highlightElevation: 40.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        },
                        child: Text(
                          "Manage Profile",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                  ),
                  /* Text(_dateTime == null
                          ? 'Must Pick a date'
                          : _dateTime.toString()),*/
                  ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width * 0.4,
                      child: RaisedButton(
                        child: Text(
                          "DATE",
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                        color: Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        highlightElevation: 40.0,
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: _dateTime == null
                                      ? DateTime.now()
                                      : _dateTime,
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime(2021))
                              .then((date) {
                            setState(() {
                              _dateTime = date;
                            });
                          });
                        },
                      )),
                  LabeledCheckbox(
                      label: 'This is the label text',
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      value: _isSelected,
                      onChanged: (bool newValue) {
                        setState(() {
                          _isSelected = newValue;
                        });
                      }),
                ],
              ),
            ),
          ])
        ],
      ),
    ));
  }
}
