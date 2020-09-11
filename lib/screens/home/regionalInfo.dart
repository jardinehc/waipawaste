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
import 'package:wdc_login/screens/home/historyPage.dart';

import 'data_list.dart';
import 'home.dart';

//DONT USE THIS DOCUMENT!!!!!!!!

class regionalInfo extends StatelessWidget {
  //https://www.digitalocean.com/community/tutorials/flutter-bar-charts

  @override
  Widget build(BuildContext context) {

    HisPage(); //because it goes so fast it hasn't loaded and doesnt work
    waipalist();


  //  waipalist ThewaipaList = new waipalist();
//
//    waipalist.pleasebethere; //works!!

   // waipalistState theee = new waipalistState();
    //theee.pleasebethere;

    print("NUMBER WEIGHTS: ");
    print(waipalist.pleasebethere);

    //print(waipa);

    int weight3 = HisPage.weight3;
    int weight2 = HisPage.weight2;
    int weight1 = HisPage.weight1;

    int numWeights = 0;
    int totalWeights = 0;

    //TODO this!!
    //somehow get the data from waipaList()

    //return StreamBuilder<WaipaData>(
      //stream: DatabaseService().waipaData,
      // builder: (context, snapshot),
       //value: DatabaseService().waipaInfos,

         //  child:
          return StreamProvider<QuerySnapshot>(
            child: Scaffold(
               body: Center(
                   child: ListView(
                     children: <Widget>[

                       //Column a
                       Column(
                           children: <Widget>[

                             //LOGO
                             Container(
                               // margin: EdgeInsets.only(top: 0.0),
                               width: 259.0,
                               height: 195.0,
                               decoration: logo,
                             ),


                             Container( //boxes c

                                 margin: EdgeInsets.all(15.0),
                                 padding: EdgeInsets.all(15.0),

                                 decoration: new BoxDecoration(
                                   borderRadius: BorderRadius.circular(20.0),
                                   shape: BoxShape.rectangle,
                                   color: HexColor("#E3F6F6"),
                                 ),

                                 child: WeightChart(
                                     data:  [
                                         WeightsSeries(
                                           date: "3 AGO",
                                           weight: weight3, // userData.waste3,
                                           barcolor: charts.ColorUtil.fromDartColor(HexColor("#00AAAD")),
                                         ),
                                         WeightsSeries(
                                           date: "2 AGO",
                                           weight: weight2,
                                           barcolor: charts.ColorUtil.fromDartColor(HexColor("#00AAAD")),
                                         ),
                                         WeightsSeries(
                                           date: "LAST ",
                                           weight: weight1,
                                           barcolor: charts.ColorUtil.fromDartColor(HexColor("#00AAAD")),
                                         ),
                                     ],
                                     dataWaipa:
                                     [
                                       WeightsSeries(
                                       date: "3 AGO",
                                       weight: 10, // userData.waste3,
                                       barcolor: charts.ColorUtil.fromDartColor(Colors.black),
                                     ),
                                     WeightsSeries(
                                       date: "2 AGO",
                                       weight: 12,
                                       barcolor: charts.ColorUtil.fromDartColor(Colors.black),
                                     ),
                                     WeightsSeries(
                                       date: "LAST ",
                                       weight: 42,
                                       barcolor: charts.ColorUtil.fromDartColor(Colors.black),
                                     )],
                                     title: "LAST 3 WASTE COLLECTIONS (Kg)"
                                 )
                             ),


                             //back button
                             Container( //container so i can set the margin
                               width: 300.0,
                               height: 50.0,
                               margin: const EdgeInsets.only(top: 5.0, bottom: 10),

                               child: RaisedButton(
                                 padding: const EdgeInsets.all(8.0),
                                 textColor: Colors.black,
                                 color: Colors.white,
                                 shape: RoundedRectangleBorder(
                                     side: BorderSide(
                                         color: HexColor("#00AAAD"), width: 2),
                                     borderRadius: BorderRadius.circular(25)),
                                 child: new Text("BACK",
                                   style: TextStyle(fontSize: 18),
                                 ),
                                 onPressed: () { Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => Home()),
                                 );},
                               ),
                             ),

                            // waipalist(),

                             //dataList(),
                           ]
                       )



//                    Container(
//                     width: 300.0,
//                     height: 50.0,
//                     margin: const EdgeInsets.only(top: 20.0),
//
//                     child:
//                     RaisedButton(
//                       padding: const EdgeInsets.all(8.0),
//                       textColor: Colors.white,
//                       color: HexColor("#00AAAD"), //get actual colour
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5)),
//                       child: new Text("HELLO",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       onPressed: () { },
//                     ),
//                   ),


                     //  waipalist();
                    ]
                   ),

                 ),

            //   ), //,
//
    //this is stream prov       );
       ),
          );
  //   );
  }
}

class WeightChart extends StatelessWidget {
  final List<WeightsSeries> data;
  final List<WeightsSeries> dataWaipa;
  final String title;


  WeightChart({@required this.data, @required this.dataWaipa, this.title});

  @override
  Widget build(BuildContext context) {

    //get the data for the chart
    List<charts.Series<WeightsSeries, String>> series =
    [
      charts.Series(
          id: "Personal",
          data:  data, //dataP,
          domainFn: (WeightsSeries series, _) =>
          series.date,
          measureFn: (WeightsSeries series, _) =>
          series.weight,
          colorFn: (WeightsSeries series, _) =>
          series.barcolor,
          //fillColorFn: (WeightsSeries series, _) => charts.MaterialPalette.transparent,
      ),
      charts.Series (
          id: "Waipa",
          data:  dataWaipa,
          domainFn: (WeightsSeries series, _) =>
          series.date,
          measureFn: (WeightsSeries series, _) =>
          series.weight,
          colorFn: (WeightsSeries series, _) =>
          series.barcolor
      )
    ];

//    //get the data for the chart
//    List<charts.Series<WeightsSeries, String>> series =
//    [
//      charts.Series(
//          id: "Weight",
//          data: data, //dataW,
//          domainFn: (WeightsSeries series, _) =>
//          series.date,
//          measureFn: (WeightsSeries series, _) =>
//          series.weight,
//          colorFn: (WeightsSeries series, _) =>
//          series.barcolor //change this colour
//      )
//    ];

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
                child: charts.BarChart
                  (
                  series,
                  animate: true,
                  barGroupingType: charts.BarGroupingType.stacked,
                ),
              )
            ],
          ),
        ),
      ),
    );

    // return charts.BarChart(series, animate: true);
  }
}


