import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chips_choice/chips_choice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartCon',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.teal,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,

        textTheme: TextTheme(
          headline2: GoogleFonts.rubik(
            textStyle: TextStyle(color: Color(0xFF637DEB), fontSize: 38.0,  fontWeight: FontWeight.w500,),
          ),
          headline3: GoogleFonts.rubik(
            textStyle: TextStyle(color: Color(0xFF4A4444), fontSize: 20.0,  fontWeight: FontWeight.w500, ),
          ),
        ),

      ),
      home: MyHomePage(title: 'SmartCon Homepage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:Column(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Container(
                      child: Text("A Title", style: Theme.of(context).textTheme.headline2,),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      child: Text("A SUBTITLE", style: Theme.of(context).textTheme.headline3,),
                      alignment: Alignment.topLeft,
                    ),
                    RaisedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      child: Text('Conference Suggestions'),
                    )
                  ],
                ),
              ),
            ]
            )
          ],
        )
      ),
    );
  }
}

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

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Test()),
    );
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

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RaisedButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
        },
        child: Text('Conference Suggestions'),
      ),
    );
  }
}