import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wdc_login/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  //collection reference
  //final CollectionReference userCollection = Firestore.instance.collection("users");
  final CollectionReference userCollection = Firestore.instance.collection('users');

  final CollectionReference waipaCollection = Firestore.instance.collection('waipa');

  final CollectionReference contactCollection = Firestore.instance.collection("contacts");


  Future updateUserData(String name, String address, String wasteBin, String recBin, String houseType, String userPin, int waste1, int waste2, int waste3) async
  {

    return await userCollection.document(uid).setData({
      'name' : name,
      'address' : address,
      'wasteBin' : wasteBin,
      'recBin' : recBin,
      'userPin' : userPin,
      'houseType': houseType,

      'waste1' : waste1,
      "waste2" : waste2,
      "waste3" : waste3,
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
      houseType: snapshot.data['houseType'],

      waste1: snapshot.data['waste1'],
      waste2: snapshot.data['waste2'],
      waste3: snapshot.data['waste3'],

    );
  }

  //get stream
  Stream<QuerySnapshot> get userInfos {
    return userCollection.snapshots();
  }

  //get user doc stream - listen to data from the user
Stream<UserData> get userData {
    //print("users uid from database: ");
    //print(uid);
    return userCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
}



//for waipa info

  //as per lesson 20

  //waipa data from snapshot
  List<Waipa> _waipaDataFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc) {
      return Waipa(
        weight: doc.data['weight'] ?? 0,
        date: doc.data['date'] ?? 0,
      );
    }).toList();
  }

  //get stream L20
/*  Stream<List<Waipa>> get waipas {
    return waipaCollection.snapshots().map(_waipaDataFromSnapshot);
  }*/

  Stream<QuerySnapshot> get waipas {
    return waipaCollection.snapshots();
  }

  Stream<QuerySnapshot> get contacts {
    return contactCollection.snapshots();
  }



  //replicating that from user
/*  WaipaData _waipaDataFromSnapshot2(DocumentSnapshot snapshot)
  {
    return WaipaData(
        uid: uid,
        weight: snapshot.data['weight'],
        date: snapshot.data['date'],
    );
  }*/


  //get user doc stream - listen to data from the user
/*  Stream<WaipaData> get waipaData {
    //print("users uid from database: ");
    //print(uid);
    return waipaCollection.document().snapshots()
        .map(_waipaDataFromSnapshot2);
  }*/

}