import 'package:flutter/material.dart';
import 'package:smartcon_app/models/session.dart';
import 'package:smartcon_app/services/database.dart';

class AnswerQuiz extends StatefulWidget {

  const AnswerQuiz({Key key, this.conferenceId, this.conferenceName}) : super(key: key);

  final String conferenceId;
  final String conferenceName;

  @override
  _AnswerQuizState createState() => _AnswerQuizState();
}

class _AnswerQuizState extends State<AnswerQuiz> {
  int _questionIdx = 0;

  void _nextQuestion(){
    setState(() {
      _questionIdx++;
    });
  }

  Widget _buildQuestion(SessionQuestion question) {
    return Column(
      children: [
        // Conference Name
        Container(
          width: MediaQuery.of(context).size.width * 0.84,
          child: Text( question.question,
              style: TextStyle(
                  fontFamily: 'Rubik',
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w400
              )),
          alignment: Alignment.topLeft,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SessionQuestion>>(
        stream: DatabaseService().getQuizQuestions(widget.conferenceId),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<SessionQuestion> quiz = snapshot.data;

            return Scaffold(
              body: Column(
                children: <Widget> [
                  Row(
                      children: <Widget> [
                        Stack(
                          children: [
                            // Header
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                  'images/pageHeader.png',
                                  fit: BoxFit.fill
                              ),
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
                              // Conference Name
                              Container(
                                width: MediaQuery.of(context).size.width * 0.84,
                                child: Text( widget.conferenceName, style: Theme.of(context).textTheme.headline2,),
                                alignment: Alignment.topLeft,
                              ),
                              SizedBox(height: 10),

                              // Answer Quiz Title
                              Container(
                                child: Text("ANSWER QUIZ", style: Theme.of(context).textTheme.headline3,),
                                alignment: Alignment.topLeft,
                              ),
                              SizedBox(height: 10),

                              // Question Widget
                              quiz.isNotEmpty ? _buildQuestion(quiz[_questionIdx]) : Container(height:0),

                              // Save Button
                              Container(
                                padding: EdgeInsets.all(8),
                                child: RaisedButton(
                                  onPressed: _nextQuestion,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.black26, width: 2)),
                                  child: Text('NEXT', style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Rubik',)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                  )
                ],
              ),
            );
          }
          else{
            print("Waiting for conference quiz");
            return Text('Result: ${snapshot.data}');
          }
        }
    );
  }
}
