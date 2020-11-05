import 'package:flutter/material.dart';
import 'package:smartcon_app/screens/profile.dart';
import 'package:smartcon_app/services/auth.dart';

class MyHomePage extends StatelessWidget {

  final AuthService _auth = AuthService();

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
                                await _auth.signOutGoogle();
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
                            onPressed: (){
                              Navigator.push( context, MaterialPageRoute(builder: (context) => Profile()), );
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