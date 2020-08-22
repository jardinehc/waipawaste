import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wdc_login/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  //collection reference
  final CollectionReference userCollection = Firestore.instance.collection("users");

  Future updateUserData(String name, String address, String wasteBin, String recBin, int userPin) async
  {
    return await userCollection.document(uid).setData({
      'name' : name,
      'address' : address,
      'wasteBin' : wasteBin,
      'recBin' : recBin,
      'userPin' : userPin,
    });
  }

  //user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot)
  {
    return UserData(
      uid: uid,
      address: snapshot.data['address'],
      name: snapshot.data['name'],
      recBin: snapshot.data['recBin'],
      userPin: snapshot.data['userPin'],
      wasteBin: snapshot.data['wasteBin'],
    );
  }

  //get stream
  Stream<QuerySnapshot> get userInfos {
    return userCollection.snapshots();
  }

  //get user doc stream - listen to data from the user
Stream<UserData> get userData {
    return userCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
}


}