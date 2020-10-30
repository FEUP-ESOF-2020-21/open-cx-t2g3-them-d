import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartcon_app/models/conference.dart';
import 'package:smartcon_app/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference profiles = FirebaseFirestore.instance.collection("profiles");
  final CollectionReference conferencesCollection = FirebaseFirestore.instance.collection("conferences");

  Future<void> updateProfile(String district, List<String> interests) async {
    return await profiles.doc(uid).set({
      "district": district,
      "interests": interests
    });
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        district: snapshot.data()['district'],
        interests: List.from(snapshot.data()['interests'])
    );
  }

  Stream<UserData> get userData {
    return profiles.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  // conference list from snapshots
  List<Conference> _conferenceListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Conference(
        name: doc.data()['name'],
        category: doc.data()['category']
      );
    }).toList();
  }

  // get conferences stream
  Stream<List<Conference>> get conferences {
    return conferencesCollection.snapshots().map(_conferenceListFromSnapshot);
  }
}