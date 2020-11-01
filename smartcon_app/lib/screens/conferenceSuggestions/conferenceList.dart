import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smartcon_app/services/database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smartcon_app/models/conference.dart';
import 'package:smartcon_app/models/user.dart';

class ConferenceList extends StatefulWidget {

  const ConferenceList({Key key, this.filterDistrict, this.ratingOrder, this.beginDate, this.endDate}) : super(key: key);

  final bool filterDistrict;
  final bool ratingOrder;
  final DateTime beginDate;
  final DateTime endDate;

  @override
  _ConferenceListState createState() => _ConferenceListState();
}

class _ConferenceListState extends State<ConferenceList> {
  @override
  Widget build(BuildContext context) {

    final conferences = Provider.of<List<Conference>>(context) ?? [];
    List<Conference> suggestedConferences = [];
    final user = Provider.of<SmartconUser>(context);

    bool isInterest(List<String> interests, String category){
      return interests.contains(category);
    }

    bool isWithinDateRange(DateTime conferenceBegin, DateTime conferenceEnd){
      return (conferenceBegin.isAfter(widget.beginDate) || conferenceBegin.isAtSameMomentAs(widget.beginDate)) &&
          (conferenceEnd.isBefore(widget.endDate) ||  conferenceEnd.isAtSameMomentAs(widget.endDate) );
    }

    bool isDesiredDistrict(String conferenceDistrict, String userDistrict){
      return !widget.filterDistrict || (widget.filterDistrict && conferenceDistrict == userDistrict);
    }

    void setSuggestedConferences(UserData userData){
      suggestedConferences = [];
      conferences.forEach((conference) {
        if (isInterest(userData.interests, conference.category) &&
            isWithinDateRange(conference.beginDate, conference.endDate) &&
            isDesiredDistrict(conference.district, userData.district)) {
          suggestedConferences.add(conference);
        }
      });
    }

    void orderByRating(){
      if(widget.ratingOrder)
        suggestedConferences.sort((a, b) => a.rating.compareTo(b.rating));
    }

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          UserData userData = snapshot.data;
          setSuggestedConferences(userData);
          orderByRating();

          return ListView.builder(
            itemCount: suggestedConferences.length,
            itemBuilder: (context, index) {
              return ConferenceTile(conference: suggestedConferences[index]);
            },
          );
        }
        else{
          print('Loading User Data');
          return Container();
        }
      }
    );
  }
}

class ConferenceTile extends StatelessWidget {

  final Conference conference;
  ConferenceTile({ this.conference });

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    List<Icon>_starsForRatings(Conference conference) {
      List<Icon> stars = [];
      for(int i = 0; i < conference.rating; i++){
        stars.add(Icon(Icons.star, color: Color(0xFF637DEB),));
      }
      return stars; }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, border: Border.all(width: 2.0, color: Colors.black26)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(conference.name.toUpperCase(), style: Theme.of(context).textTheme.headline5,),
                          alignment: Alignment.topLeft,
                        ),
                        Row(children:_starsForRatings(conference))
                      ]
                  ),
                  SizedBox(height: 2),
                  Container(
                    child: Text(conference.category, style: Theme.of(context).textTheme.headline3,),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: 2),
                  Container(
                    child: Text(conference.district, style: TextStyle(fontSize: 17.0, fontFamily: 'Rubik', color: Colors.black38, fontWeight: FontWeight.w400)),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: 7),
                  Container(
                    child: Text(conference.description, style: TextStyle(fontSize: 17.0, fontFamily: 'Rubik', color: Color(0xFF4A4444), fontWeight: FontWeight.w400)),
                    alignment: Alignment.topLeft,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(DateFormat.yMMMd().format(conference.beginDate) + ' - ' + DateFormat.yMMMd().format(conference.endDate), style: TextStyle(fontSize: 17.0, fontFamily: 'Rubik', color: Colors.black38, fontWeight: FontWeight.w400)),
                        alignment: Alignment.topLeft,
                      ),
                      Container(
                          child: RaisedButton(
                            color: Color(0xFF6E96EF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            onPressed: () async { _launchURL(conference.website);},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("MORE", style: Theme.of(context).textTheme.headline4,),
                            ),)
                      )
                    ],
                  ),
                ]
                ),
            ),
          ),
    );
  }
}
