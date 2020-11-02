import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

import 'main.dart';

class SearchConferences extends StatefulWidget {
  SearchConferences({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchConferences createState() => _SearchConferences();
}




class _SearchConferences extends State<SearchConferences> {
  
  bool _rating = false;
  bool _near= false;
  List<DateTime> datas =[];
 

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
                    left: MediaQuery.of(context).size.width * 0.06,
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
                              "MANAGE PROFILE",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                      ),
                      
                      Container(
                          height: 35.0,
                          child: Text('DATE', style: Theme.of(context).textTheme.headline6,),
                          alignment: Alignment.center,
                      ),
                       Container(
                        child:  Row(
                          children:<Widget>[
                            
            
                            new MaterialButton(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              highlightElevation: 40.0,
                              onPressed: () async {
                                final List<DateTime> picked = await DateRagePicker.showDatePicker(
                                    context: context,
                                    initialFirstDate: new DateTime.now(),
                                    initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
                                    firstDate: new DateTime(2020),
                                    lastDate: new DateTime(2021)
                                );
                                if (picked != null && picked.length == 2) {
                                    print(picked);
                                }
                                datas=picked;
                              },
                              
                              child: Text(
                                "CHANGE",
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.center,
                              )
                            ),

                              
                              Container(
                               decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent,width:3.0),
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                width: 230.0,
                                height: 40.0,
                                
                                child: Text(datas.length==0 
                                    ? 'Must Pick a date'
                                    : "FROM: " +datas[0].toString().substring(0,10) + "\n TO: "  +datas[1].toString().substring(0,10), 
                                    style: Theme.of(context).textTheme.headline6,textAlign: TextAlign.center),
                                alignment: Alignment.center,
                            ),
                      
                          ]),
                       ),

                      Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.04,
                  ),
                        child: Container(
                        child:  Row(
                          children:<Widget>[
                            Checkbox(
                              value:_rating,
                              onChanged: (bool value){
                                setState((){
                                  _rating=value;
                                });
                              },
                            ),
                            Text(
                              "SORT BY RATING",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                            Checkbox(
                              value:_near,
                              onChanged: (bool value){
                                setState((){
                                  _near=value;
                                });
                              },
                            ),
                            Text(
                              "ONLY NEAR YOU",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                          ]
                          
                          ),
                      )
                      ),

                       Container(
                          color: Colors.amber[600],
                          width: 350.0,
                          height: 50.0,
                          child: Text('CONFERENCE1', style: Theme.of(context).textTheme.headline6,),
                          alignment: Alignment.center,
                      ),
                      Container(
                          color: Colors.amber[600],
                          width: 350.0,
                          height: 50.0,
                          child: Text('CONFERENCE2', style: Theme.of(context).textTheme.headline6,),
                          alignment: Alignment.center,
                      ),



                ],
              ),
            ),
          ])
                
        ],
      ),
            
    ));
  }
}



