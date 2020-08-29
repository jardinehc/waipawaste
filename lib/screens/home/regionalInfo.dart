import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wdc_login/models/user.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/services/database.dart';
import 'package:wdc_login/services/weights_series.dart';
import 'package:wdc_login/shared/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:wdc_login/shared/loading.dart';

import 'data_list.dart';
import 'home.dart';

class regionalInfo extends StatelessWidget {
  //https://www.digitalocean.com/community/tutorials/flutter-bar-charts

  @override
  Widget build(BuildContext context) {

   // User user = Provider.of<User>(context);
   // WaipaCollection waipas = Provider.of<WaipaCollection>(context);
   // print(waipa);
    print("HELLO");

   // final waipas = Provider.of<QuerySnapshot>(context);

     return StreamProvider<QuerySnapshot>.value(
       value: DatabaseService().waipaInfos,


           child:
           Scaffold(
             body: waipalist(),
//             Container(
//                 width: 300.0,
//                 height: 50.0,
//                 margin: const EdgeInsets.only(top: 20.0),
//
//                 child:
//                 RaisedButton(
//                   padding: const EdgeInsets.all(8.0),
//                   textColor: Colors.white,
//                   color: HexColor("#00AAAD"), //get actual colour
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5)),
//                   child: new Text("HELLO",
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   onPressed: () { },
//                 ),
//               ),
           ),
       );
   //  );
  }
}

class WeightChart extends StatelessWidget {
  final List<WeightsSeries> data;
  final String title;

  WeightChart({@required this.data, this.title});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.body2,
              ),
              Expanded(
               // child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );

    // return charts.BarChart(series, animate: true);
  }
}

