import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homePage.dart';

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
            textStyle: TextStyle(
              color: Color(0xFF637DEB),
              fontSize: 38.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          headline3: GoogleFonts.rubik(
            textStyle: TextStyle(
              color: Color(0xFF4A4444),
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          headline4: GoogleFonts.rubik(
            textStyle: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 40.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          headline5: GoogleFonts.rubik(
            textStyle: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 22.0,
            ),
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
                left: MediaQuery.of(context).size.width * 0.08,
                right: MediaQuery.of(context).size.width * 0.08,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "A Title",
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
                  // A button that can be used as a link to other page
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyMainHomePage()),
                      );
                    },
                    child: Text('Main Home Page first try'),
                  )
                ],
              ),
            ),
          ])
        ],
      )),
    );
  }
}
