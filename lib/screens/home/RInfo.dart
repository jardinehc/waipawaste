import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wdc_login/models/user.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/services/database.dart';
import 'package:wdc_login/shared/loading.dart';

class RInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().waipas,
      child: Scaffold(
        body: waipalist1(),
      ),
    );
  }
}


class waipalist1 extends StatefulWidget {

  @override
  _waipalistState1 createState() => _waipalistState1();
  //waipalistState1 wp = new waipalistState1();

  static int pleasebethere = 90;


  int weightOne = _waipalistState1.weight1;
  int weightTwo = _waipalistState1.weight2;
  int weightThree;

}

class _waipalistState1 extends State<waipalist1> {
  int numWeights = 560;
  int totalWeights = 0;

  static int weight1;
  static int weight2;
  static int weight3;

  // it can get that 99 but isnt running the build thingng
  @override
  Widget build(BuildContext context) {

   // weight2 = 90;

    //this is from lesson 18

    final waipaData = Provider.of<QuerySnapshot>(context);
    for (var doc in waipaData.documents)
    {
      //currentU = u.user;

     // print("this is printing");
      print(doc.data['weight']);

      if(doc.data['date'] == "1")
        {
          weight1 = doc.data['weight'];
        }
      else if(doc.data['date'] == "2")
        {
          weight2 = doc.data['weight'];
        }
      else
        {
          weight3 = doc.data['weight'];
        }

    }

    //here i will add the charts!!!
    return Container(
      width: 300.0,
      height: 50.0,
      margin: const EdgeInsets.only(top: 20.0),

      child:
      RaisedButton(
          padding: const EdgeInsets.all(8.0),
          textColor: Colors.white,
          color: HexColor("#00AAAD"),
          child: new Text("$weight1",
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () {
    /*        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RInfo()),
            );*/
          }
      ),
    );

 /* @override
  Widget build(BuildContext context) {

    final waipas = Provider.of<List<Waipa>>(context);
    waipas.forEach((waipa) {
      if (waipa.date == 1) {
        print("CHECKING");
        weight1 = waipa.weight;
      }
      else {
        //waipalist1.weightTwo = waipa.weight;
        weight2 = waipa.weight;
      }


      numWeights ++;
      totalWeights = (totalWeights + waipa.weight);

      print(waipa.weight);
    });

    waipalist1.pleasebethere = 100;

    print(totalWeights / numWeights);

    print("WAIPA LISSSTTTT");
//    final waipas = Provider.of<QuerySnapshot>(context);
//    for (var doc in waipas.documents)
//    {
//      print(doc.data); //['weight']
//    }
    // return numWeights;
    //return Container();*/
  }
}

