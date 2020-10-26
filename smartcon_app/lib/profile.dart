import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:chips_choice/chips_choice.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _district, _districtResult;
  List<String> _interests = [ "Technology", "Art & Design", "Finance", "Sports",
    "Literature", "Marketing", "Scientific", "Wellness"];
  List<String> _selectedInterests = [];
  final profileKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _district = '';
    _districtResult = '';
  }

  _saveForm() {
    var form = profileKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _districtResult = _district;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            children: <Widget> [
              // HEADER IMAGE (100%)
              Row(
                  children: <Widget> [
                    Expanded(
                      child: Image.asset(
                        'images/pageHeader.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ]
              ),
              // CONTENT ROW
              Row(
                children: <Widget> [
                  // MARGINS
                  Padding(
                    padding:  EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08,
                      right: MediaQuery.of(context).size.width * 0.08,
                    ),
                    child:
                    // CONTENT
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Row(
                              children: [
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text("Your Profile", style: Theme.of(context).textTheme.headline2,)
                                ),]
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.84,
                            child: Form(
                              key: profileKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 5),
                                    alignment: Alignment.topLeft,
                                    child: Text('DISTRICT', style: Theme.of(context).textTheme.headline3,),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: DropDownFormField(
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
                                      dataSource: [
                                        {"display": "Porto", "value": "Porto",},
                                        {"display": "Aveiro", "value": "Aveiro",},
                                        {"display": "Lisboa", "value": "Lisboa",},
                                        {"display": "Viana do Castelo", "value": "Viana do Castelo",},
                                        {"display": "Faro", "value": "Faro",},
                                      ],
                                      textField: 'display',
                                      valueField: 'value',
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 5),
                                    alignment: Alignment.topLeft,
                                    child: Text('INTERESTS', style: Theme.of(context).textTheme.headline3,),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.84,
                                    child: ChipsChoice<String>.multiple(
                                      value: _selectedInterests,
                                      onChanged: (val) => setState(() => _selectedInterests = val),
                                      choiceItems: C2Choice.listFrom<String, String>(
                                        source: _interests,
                                        value: (i, v) => v,
                                        label: (i, v) => v,
                                      ),
                                      choiceStyle: C2ChoiceStyle(
                                      ),
                                      choiceActiveStyle: const C2ChoiceStyle(
                                        showCheckmark: false,
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: RaisedButton(
                                      child: Text('SAVE'),
                                      onPressed: _saveForm,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
        )
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> interests;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.interests, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();

  _buildChoiceList() {
    List<Widget> choices = List();

    widget.interests.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}