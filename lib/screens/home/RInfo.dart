import 'dart:io';
import 'package:wdc_login/screens/home/historyPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wdc_login/models/user.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/services/database.dart';
import 'package:wdc_login/services/weights_series.dart';
import 'package:wdc_login/shared/constants.dart';
import 'package:wdc_login/shared/loading.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'home.dart';

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


/*
  int weightOne = _waipalistState1.weight1;
  int weightTwo = _waipalistState1.weight2;
  int weightThree;
*/

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

    int userWeight3 = HisPage.weight3;
    int userWeight2 = HisPage.weight2;
    int userWeight1 = HisPage.weight1;

    //this is from lesson 18

    final waipaData = Provider.of<QuerySnapshot>(context);
    for (var doc in waipaData.documents)
    {

      if(doc.data['date'] == 1)
        {
          weight1 = doc.data['weight'];
        }
       else if(doc.data['date'] == 2)
        {
          weight2 = doc.data['weight'];
        }
      else
        {
          weight3 = doc.data['weight'];
        }

      print("weight 1: $weight1");
      print("weight 2: $weight2");
      print("weight 3: $weight3");

    }

    //here i will add the charts!!! this is what is displayed on the screen
    return Center(
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
                              weight: userWeight3, // userData.waste3,
                              barcolor: charts.ColorUtil.fromDartColor(HexColor("#00AAAD")),
                            ),
                            WeightsSeries(
                              date: "2 AGO",
                              weight: userWeight2,
                              barcolor: charts.ColorUtil.fromDartColor(HexColor("#00AAAD")),
                            ),
                            WeightsSeries(
                              date: "LAST ",
                              weight: userWeight1,
                              barcolor: charts.ColorUtil.fromDartColor(HexColor("#00AAAD")),
                            ),
                          ],
                          dataWaipa:
                          [
                            WeightsSeries(
                              date: "3 AGO",
                              weight: weight3, // userData.waste3,
                              barcolor: charts.ColorUtil.fromDartColor(Colors.black),
                            ),
                            WeightsSeries(
                              date: "2 AGO",
                              weight: weight2,
                              barcolor: charts.ColorUtil.fromDartColor(Colors.black),
                            ),
                            WeightsSeries(
                              date: "LAST ",
                              weight: weight1,
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
                ]
            )
          ]
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
  }
}
