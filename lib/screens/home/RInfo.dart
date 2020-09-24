import 'dart:io';
import 'package:intl/intl.dart';
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
        backgroundColor: const Color(0xffffffff),
        body: waipalist1(),
      ),
    );
  }
}


class waipalist1 extends StatefulWidget {

  @override
  _waipalistState1 createState() => _waipalistState1();
}

class _waipalistState1 extends State<waipalist1> {
  int numWeights = 560;
  int totalWeights = 0;

  static int weight1;
  static int weight2;
  static int weight3;


  @override
  Widget build(BuildContext context) {

    int userWeight3 = HisPage.weight3;
    int userWeight2 = HisPage.weight2;
    int userWeight1 = HisPage.weight1;

    List<int> weight1List = new List();
    List<int> weight2List = new List();
    List<int> weight3List = new List();

    int total1 = 0;
    int total2 = 0;
    int total3 = 0;

    int count1 = 0;
    int count2 = 0;
    int count3 = 0;

    int avgWeight1 = 0;
    int avgWeight2 = 0;
    int avgWeight3 = 0;

    DateTime collectionDate = null;
    final today = DateTime.now();
    int collectionWeek = 0;

    //this is from lesson 18
    final waipaData = Provider.of<QuerySnapshot>(context);
    for (var doc in waipaData.documents)
    {
      if(doc.data['date'] != null)
        {
            /*collectionDate = DateTime.parse(doc.data['dateTime']);
            int difference = collectionDate.difference(today).inDays;
            print("difference $difference");*/

            collectionWeek = doc.data['date'];

            //get the current week of the year
            int weekNumber(DateTime date) {
              int dayOfYear = int.parse(DateFormat("D").format(date));
              return ((dayOfYear - date.weekday + 10) / 7).floor();
            }
            //print(weekNumber(today));

            int difference = weekNumber(today) - collectionWeek;
            //print("difference $difference");

            if(difference < 0 )
              {
                difference = 52 + difference;
              }

            //if(doc.data['date'] == 1)
            if(difference == 1)
            {
              weight1 = doc.data['weight'];
              weight1List.add(weight1);
            }
           // else if(doc.data['date'] == 2)
            else if(difference == 2)
            {
              weight2 = doc.data['weight'];
              weight2List.add(weight2);
            }
            else
            {
              weight3 = doc.data['weight'];
              weight3List.add(weight3);
            }

        }
/*      print("weight 1: $weight1");
      print("weight 2: $weight2");
      print("weight 3: $weight3");*/

    }

    //find averages for each time period

    //weight 1
      for(int i in weight1List)
      {
        total1 += i;
        count1 ++;
      }
      if(total1 != 0)
      {
        avgWeight1 = total1 ~/ count1;
      }

      //weight 2
    for(int i in weight2List)
    {
      total2 += i;
      count2 ++;
    }
    if(total2 != 0)
    {
    avgWeight2 = total2 ~/ count2;
    }

    //weight 3
    for(int i in weight3List)
    {
      total3 += i;
      count3 ++;
    }
    avgWeight3 = total3 ~/ count3;

    //this is what is displayed on the screen
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

                 Row(
                      children: <Widget>[

                        Container( //user colour box

                          width: 40,
                          height: 25,
                          //margin: EdgeInsets.all(5.0),
                          margin: EdgeInsets.only(
                              left: 15.0),
                          decoration:BoxDecoration (
                              shape: BoxShape.rectangle,
                              color: Colors.black,
                          )
                        ),

                        Container( //name box

                          width: 150,
                          height: 50,
                          //margin: EdgeInsets.all(5.0),
                          /*margin: EdgeInsets.only(
                              left: 2.0)*/
                          child: Center(
                            child: Text(
                              '= your last 3 waste\ncollections',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        Container( //colour box

                          width: 40,
                          height: 25,
                          //margin: EdgeInsets.all(5.0),
                          margin: EdgeInsets.only(
                              left: 10.0),
                          decoration: boxDecoration,
                        ),

                        Container( //text box waipa

                          width: 150,
                          height: 50,
                          //margin: EdgeInsets.all(5.0),
                          /*margin: EdgeInsets.only(
                              bottom: 5.0, left: 5.0),*/
                          child: Center(
                            child: Text(
                              '= average of similar households',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                      ],
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
                              weight: userWeight3,
                              barcolor: charts.ColorUtil.fromDartColor(Colors.black),
                            ),
                            WeightsSeries(
                              date: "2 AGO",
                              weight: userWeight2,
                              barcolor: charts.ColorUtil.fromDartColor(Colors.black),
                            ),
                            WeightsSeries(
                              date: "LAST ",
                              weight: userWeight1,
                              barcolor: charts.ColorUtil.fromDartColor(Colors.black),
                            ),
                          ],
                          dataWaipa:
                          [
                            WeightsSeries(
                              date: "3 AGO",
                              weight: avgWeight3,
                              barcolor: charts.ColorUtil.fromDartColor(HexColor("#00AAAD")),
                            ),
                            WeightsSeries(
                              date: "2 AGO",
                              weight: avgWeight2,
                              barcolor: charts.ColorUtil.fromDartColor(HexColor("#00AAAD")),
                            ),
                            WeightsSeries(
                              date: "LAST ",
                              weight: avgWeight1,
                              barcolor: charts.ColorUtil.fromDartColor(HexColor("#00AAAD")),
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

