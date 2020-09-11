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

        print("this is printing");
        print(doc.data['uid']);


      }

    return Container();
  }
}

class waipalist extends StatefulWidget {

  @override
  waipalistState createState() => waipalistState();
  static int pleasebethere;

  static int weightOne = 110;
  static int weightTwo;
  static int weightThree;

}

//this was _ but i need to access it
class waipalistState extends State<waipalist> {
  int numWeights = 0;
  int totalWeights = 0;

  @override
  Widget build(BuildContext context) {

    final waipas = Provider.of<List<WaipaData>>(context);
    waipas.forEach((waipa) {

      if(waipa.date == 1)
        {
          waipalist.weightOne = waipa.weight;
        }
      else
        {
        waipalist.weightTwo = waipa.weight;
      }


      numWeights ++;
      totalWeights = (totalWeights + waipa.weight);

      print(waipa.weight);
    });

    waipalist.pleasebethere = 10;

    print(totalWeights / numWeights);

    print("WAIPA LISSSTTTT");
//    final waipas = Provider.of<QuerySnapshot>(context);
//    for (var doc in waipas.documents)
//    {
//      print(doc.data); //['weight']
//    }
 // return numWeights;
    return Container();
  }



}

