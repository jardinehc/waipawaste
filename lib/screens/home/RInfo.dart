import 'dart:io';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:intl/intl.dart';
import 'package:wdc_login/screens/home/historyPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/services/database.dart';
import 'package:wdc_login/services/weights_series.dart';
import 'package:wdc_login/shared/constants.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'home.dart';

class RInfo extends StatelessWidget {
//waipa info
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

    HisPage();

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
                   mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        /*SizedBox(
                          width: 12
                        ),*/
                      //  Expanded (
                      //    flex: 1,

                     //    child: Row(
                     //      children: <Widget>[

                         Container( //user colour box

                          width: 40,
                          height: 25,
                          //margin: EdgeInsets.all(5.0),
                        //  margin: EdgeInsets.only(
                         //     left: 25.0),
                            decoration: boxDecoration,
                        ),

                        Container(

                          width: 100,
                          height: 50,
                          //margin: EdgeInsets.all(5.0),
                          /*margin: EdgeInsets.only(
                              left: 2.0)*/
                          child: Center(
                            child: Text(
                              '= your last 3 waste\ncollections',
                              style: TextStyle(
                                fontSize: 12,
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
                            decoration:BoxDecoration (
                              shape: BoxShape.rectangle,
                              color: Colors.black,
                            )
                        ),

                        Container( //text box waipa

                          width: 100,
                          height: 50,
                          child: Center(
                            child: Text(
                              '= average of similar households',
                              style: TextStyle(
                                fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ),
                  //        ],
                //         ),
              //   ),
    ],
                 ),
                      ],
                    ),


                  Container( //boxes c
                    child: WeightChart(
                          data:  [
                            WeightsSeries(
                              date: "3 AGO",
                              weight: userWeight3,
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
                              weight: avgWeight3,
                              barcolor: charts.ColorUtil.fromDartColor(Colors.black),
                            ),
                            WeightsSeries(
                              date: "2 AGO",
                              weight: avgWeight2,
                              barcolor: charts.ColorUtil.fromDartColor(Colors.black),
                            ),
                            WeightsSeries(
                              date: "LAST ",
                              weight: avgWeight1,
                              barcolor: charts.ColorUtil.fromDartColor(Colors.black),
                            )],
                          title: "LAST 3 WASTE COLLECTIONS (kg)"
                      ),
                  ),


                  //back button
                  Container( //container so i can set the margin
                    width: double.infinity,
                    height: 50.0,
                    margin: const EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 20),

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
    );
  }

  Widget sample2(BuildContext context, int u1, int u2, int u3, int w1, int w2, int w3) {
    return Center(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: BezierChart(
          bezierChartScale: BezierChartScale.CUSTOM,
          xAxisCustomValues: const [1, 2, 3], // 4, 5, 6, 7],
          series:  [
            BezierLine(
              //users weights
              lineColor: HexColor("#00AAAD"),
              lineStrokeWidth: 3.0,
              label: "Your Weight (kg)",
              data:  [
                DataPoint<double>(value: u1.toDouble(), xAxis:  1),
                DataPoint<double>(value: u2.toDouble(), xAxis: 2),
                DataPoint<double>(value: u3.toDouble(), xAxis: 3),
               /* DataPoint<double>(value: 50, xAxis: 4),
                DataPoint<double>(value: 40, xAxis: 5),
                DataPoint<double>(value: 10, xAxis: 6),
                DataPoint<double>(value: 30, xAxis: 7),*/
              ],
            ),
            BezierLine(
              //waipa weights
              lineColor: Colors.black,
              lineStrokeWidth: 3.0,
              label: "Average of Waipa (kg)",
              data: [
                DataPoint<double>(value: w1.toDouble(), xAxis: 1),
                DataPoint<double>(value: w2.toDouble(), xAxis: 2),
                DataPoint<double>(value: w3.toDouble(), xAxis: 3),
              ],
            ),
          ],
          config: BezierChartConfig(
            //updatePositionOnTap: true,
            xAxisTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            verticalIndicatorStrokeWidth: 2.0,
            verticalIndicatorColor: Colors.black12,
            showVerticalIndicator: true,
            contentWidth: MediaQuery.of(context).size.width * 2,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
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
                  barGroupingType: charts.BarGroupingType.grouped,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



