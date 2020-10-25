import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:google_fonts/google_fonts.dart';

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
          headline2: GoogleFonts.montserrat(
            textStyle: TextStyle(color: Color(0xFF637DEB), fontSize: 40.0,  fontWeight: FontWeight.w500,),
          ),
          headline3: GoogleFonts.montserrat(
            textStyle: TextStyle(color: Color(0xFF4A4444), fontSize: 23.0,  fontWeight: FontWeight.w700,),
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
  String _myDistrict;
  String _myDistrictResult;
  final districtKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myDistrict = '';
    _myDistrictResult = '';
  }

  _saveForm() {
    var form = districtKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myDistrictResult = _myDistrict;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
                              children: [Text("Your Profile", style: Theme.of(context).textTheme.headline2,),]
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.84,
                            child: Form(
                              key: districtKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: DropDownFormField(
                                      titleText: 'District',
                                      hintText: 'Choose a district',
                                      value: _myDistrict,
                                      onSaved: (value) {
                                        setState(() {
                                          _myDistrict = value;
                                        });
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          _myDistrict = value;
                                        });
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
    );
  }
}