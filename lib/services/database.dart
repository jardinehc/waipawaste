import 'package:cloud_firestore/cloud_firestore.dart';

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

}