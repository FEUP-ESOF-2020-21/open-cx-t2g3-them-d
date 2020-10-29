import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartcon_app/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference profiles = FirebaseFirestore.instance.collection('profiles');

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
}