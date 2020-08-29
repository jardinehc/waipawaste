import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wdc_login/models/user.dart';
import 'package:wdc_login/services/auth.dart';
import 'package:wdc_login/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class dataList extends StatefulWidget {
  @override
  _dataListState createState() => _dataListState();
}

AuthService u;
User currentU;

class _dataListState extends State<dataList> {
  @override
  Widget build(BuildContext context) {
    
    final userData = Provider.of<QuerySnapshot>(context);
    for (var doc in userData.documents)
      {
        //currentU = u.user;

        print(doc.data['uid']);


      }

    return Container();
  }
}

class waipalist extends StatefulWidget {
  @override
  _waipalistState createState() => _waipalistState();
}

class _waipalistState extends State<waipalist> {
  @override
  Widget build(BuildContext context) {
    final waipas = Provider.of<QuerySnapshot>(context);
    for (var doc in waipas.documents)
    {
      //currentU = u.user;
      print("A DOCUMENT!!!");
      print(doc.data); //['weight']


    }
    return Container();
  }
}

