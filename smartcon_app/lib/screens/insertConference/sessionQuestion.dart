import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smartcon_app/models/conference.dart';
import 'package:smartcon_app/models/session.dart';
import 'package:smartcon_app/screens/insertConference/newSession.dart';
import 'package:smartcon_app/screens/insertConference/conferenceSessions.dart';
import 'package:smartcon_app/services/database.dart';

class BuildSessionQuestion extends StatefulWidget {
  SessionQuestion sessionQuestion;
  BuildSessionQuestion({Key key}) : super(key: key);

  @override
  _BuildSessionQuestion createState() => _BuildSessionQuestion();
}

class _BuildSessionQuestion extends State<BuildSessionQuestion> {

  final GlobalKey<FormState> _questionKey = GlobalKey<FormState>();

  String _question;
  String _type = 'conceptKnowledge';
  int _required;
  List<String> _options = List<String>(4);
  List<int> _answers = List<int>();

  _buildSessionQuestion(){
    widget.sessionQuestion = new SessionQuestion(
      question: _question,
      options: _options,
      required: _required,
      answers: _answers,
      type: _type
      );
  }

  Widget _buildQuestion() {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width*0.84,
      child: TextFormField(
        decoration: new InputDecoration(
          labelText: "Question",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: new BorderSide(),
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'A Question is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _question = value;
        },
      ),
    );
  }

  Widget _buildRequired() {
    return Container(
      alignment: Alignment.centerRight,
      width: MediaQuery.of(context).size.width * 0.2,
      height: 40,
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
        decoration: new InputDecoration(
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: new BorderSide(),
          ),
        ),
        validator: (value) {
          var temp = int.tryParse(value);
          if (value == null) return 'This field is required (0 to 4) - see explanation below (?)';

          if (temp < 0 || temp > 4) {
            return 'This field is required (0 to 4) - see explanation below (?)';
          }
          return null;
        },
        onSaved: (value) {
          var temp = int.tryParse(value);
          _required = temp;
        },
      ),
    );
  }

  Widget _buildOption(optionIdx, letter) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.1,
          child: Text(
            letter,
            style: TextStyle(
              color: Color(0xFF637DEB),
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          alignment: Alignment.topLeft,
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.74,
          child: TextFormField(
            decoration: new InputDecoration(
              labelText: "Option",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: new BorderSide(),
              ),
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'All Options are Required';
              }
              return null;
            },
            onSaved: (String value) {
              _options[optionIdx] = value;
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Conference>>.value(
      value: DatabaseService().conferences,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // HEADER IMAGE (100%)
                Row(children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child:
                        Image.asset('images/pageHeader.png', fit: BoxFit.fill),
                  ),
                ]),

                // CONTENT ROW
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.08,
                    right: MediaQuery.of(context).size.width * 0.08,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.84,
                        child: Text(
                          "Session Question",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.84,
                        child: Text(
                          "Make a Question to test Attendees knowledge",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Rubik',
                          ),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.08,
                    right: MediaQuery.of(context).size.width * 0.08,
                  ),
                  child: Form(
                    key: _questionKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width*0.84,
                            child: Text(
                              "QUESTION",
                              style: TextStyle(
                                color: Color(0xFF4A4444),
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          SizedBox(height: 10),
                          _buildQuestion(),

                          SizedBox(height: 10),
                          Row(
                            children: [ Container(
                              width: MediaQuery.of(context).size.width * 0.64,
                              child: Text(
                                "KNOLDGE REQUIRED ",
                                style: TextStyle(
                                  color: Color(0xFF4A4444),
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          _buildRequired()
                          ]),

                          SizedBox(height: 10),
                          _buildOption(0,'A. '),
                          SizedBox(height: 10),
                          _buildOption(1,'B. '),
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                          _buildOption(2,'C. '),
                          SizedBox(height: 10),
                          _buildOption(3,'D. '),
                          SizedBox(height: 10),

                        ]),
                  ),
                ),
        ]),
      ),
        floatingActionButton:
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            heroTag: "btn2",
            child: Icon(Icons.done),
            backgroundColor: Color(0xFF5BBDB8),
            onPressed: onSave,
            foregroundColor: Colors.white,
          ),
        ),
    ));
  }

  //on save forms
  //on save forms
  void onSave() async{
    if (_questionKey.currentState.validate()) {
      _questionKey.currentState.save();
      _buildSessionQuestion();

      Navigator.pop(context, widget.sessionQuestion);
    }
  }
}
