import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child:Column(
            children: <Widget> [
              Row(
                  children: <Widget> [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                              'images/pageHeader.png',
                              fit: BoxFit.fill
                          ),
                        ),
                        Padding(
                            padding:  EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.08,
                              top: MediaQuery.of(context).size.width * 0.08,
                            ),
                            child: RaisedButton(
                              onPressed: () async {
                                MaterialPageRoute(builder: (context) => DemoPage());
                              },
                              color: Color(0xFF6E96EF),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("SIGN OUT", style: Theme.of(context).textTheme.headline4,),
                              ),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            )
                        ),
                      ],
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
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.black26, width: 2)),
                              child: Text('SAVE', style: TextStyle(color:Colors.black38, fontSize: 14.0,  fontWeight: FontWeight.w700, fontFamily: 'Rubik',)),
                              onPressed: () async {
                                MaterialPageRoute(builder: (context) => DemoPage());
                              }
                          ),
                          Container(
                            child: Text(
                                "Some normal text",
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  color: Colors.black87,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400
                                )
                            ),
                            alignment: Alignment.topLeft,
                          ),
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