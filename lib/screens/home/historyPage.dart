import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wdc_login/models/user.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/screens/home/history.dart';
import 'package:wdc_login/services/database.dart';
import 'package:wdc_login/services/weights_series.dart';
import 'package:wdc_login/shared/constants.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:wdc_login/services/weights_series.dart';
import 'package:wdc_login/shared/loading.dart';

import 'home.dart';

class HisPage extends StatelessWidget {
  //https://www.digitalocean.com/community/tutorials/flutter-bar-charts

  static int weight3;
  static int weight2;
  static int weight1;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    int differnce;
    bool upward = false;
    bool downward = false;
    bool neutral = false;
    bool noResults = true;

    String resultText = "";

    String upwardText = "Your recent collections have been getting heavier!"
        "\nTry recyling plastics 1, 2, or 5 and cardboard.";
    String downwardText = "Welldone on your efforts at decreasing your rubbish!"
        "\nHave you tried using packaging free products?";
    String neutralText = "Your waste is remaing the same!"
        "\nHave you tried using packaging free products?";
    String noResultsText = "You have no recent collections.";


    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {

        if(snapshot.hasData)
          {
            UserData userData = snapshot.data;

            weight3 = userData.waste3;
            weight2 = userData.waste2;
            weight1 = userData.waste1;

            final List<WeightsSeries> data = [
              WeightsSeries(
                date: "3 AGO",
                weight: weight3, // userData.waste3,
                barcolor: charts.ColorUtil.fromDartColor(HexColor("#00AAAD")),
              ),
              WeightsSeries(
                date: "2 AGO",
                weight: userData.waste2,
                barcolor: charts.ColorUtil.fromDartColor(HexColor("#00AAAD")),
              ),
              WeightsSeries(
                date: "LAST ",
                weight: userData.waste1,
                barcolor: charts.ColorUtil.fromDartColor(HexColor("#00AAAD")),
              ),
            ];

            differnce = userData.waste1 - userData.waste2;

            if(userData.waste2 != 0)
              {
                noResults = false;
              }
            if(differnce > 0 && !noResults)
              {
                upward = true;
                resultText = "Your recent collections have been getting heavier!"
                    "\nTry recyling plastics 1, 2, or 5 and cardboard.";
              }
            else if(differnce < 0 && !noResults)
              {
                resultText = "Well done on your efforts at decreasing your rubbish!"
                    "\nHave you tried using packaging free products? ";
                downward = true;
              }
            else if(!noResults)
              {
                resultText = "Your waste is remaing the same!"
                    "\nHave you tried using packaging free products?";
                neutral = true;
              }

            if(noResults)
              {
                resultText = "You have no recent collections.";
              }

            return Scaffold(
              backgroundColor: const Color(0xffffffff),
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

                                 // margin: EdgeInsets.all(5.0),
                                  padding: EdgeInsets.all(5.0),
                                margin: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),

                                /*  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shape: BoxShape.rectangle,
                                    color: HexColor("#E3F6F6"),
                                  ),*/

                               // child: sample1(context, weight1, weight2, weight3),
                                  child: WeightChart(
                                    data: data,
                                    title: "LAST 3 WASTE COLLECTIONS (kg)"
                                  )
                              ),

                              //text depending on trend
                              Container(
                                width: 200,
                                height: 80,
                                margin: EdgeInsets.only(bottom: 8.0),
                                //padding: EdgeInsets.all(10.0),
                                decoration: new BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.white,
                                 /* border: Border.all(
                                    color: HexColor("#00AAAD"),
                                    width: 2,
                                  ),*/
                                ),
                                child: Center(
                                //  child: Container(
                                   // height: double.infinity,
                                  // width: double.infinity,
                                   // margin: const EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 20),
                                    //child: Expanded(
                                    child: Text(
                                      resultText,
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                 //   ),
                                  ),
                                ),
                            //  ),

                              //back button
                              Container(
                                width: 300.0,
                                height: 50.0,
                                margin: const EdgeInsets.only(top: 5.0, bottom: 10),

                                child: RaisedButton(
                                 // padding: const EdgeInsets.all(8.0),
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

                              //dataList(),
                            ]
                        )
                      ]
                  )
              ),

            );
          }
        else
          {
            return Loading();
          }


      }
    );
  }

   Widget sample1(BuildContext context, int w1, int w2, int w3) {
    return Center(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width * 0.9,
        child: BezierChart(
          bezierChartScale: BezierChartScale.CUSTOM,
          xAxisCustomValues: const [0, 5, 10],
          series:  [
            BezierLine(
              lineColor: Colors.black, //charts.ColorUtil.fromDartColor(HexColor("#00AAAD"))
              data:  [
                DataPoint<double>(value: weight1.toDouble(), xAxis: 0),
                DataPoint<double>(value: weight2.toDouble(), xAxis: 5),
                DataPoint<double>(value: weight3.toDouble(), xAxis: 10),
              ],
            ),
          ],
          config: BezierChartConfig(
            xAxisTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            verticalIndicatorStrokeWidth: 3.0,
            verticalIndicatorColor: Colors.black,
            showVerticalIndicator: true,
            backgroundColor: Colors.white,
            bubbleIndicatorColor: Colors.black,
            snap: false,
          ),
        ),
      ),
    );
  }

}

class WeightChart extends StatelessWidget {
  final List<WeightsSeries> data;
  final String title;

  WeightChart({@required this.data, this.title});

  @override
  Widget build(BuildContext context) {
    //get the data for the chart
    List<charts.Series<WeightsSeries, String>> series =
    [
      charts.Series(
        id: "Weight",
        data: data,
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
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );

   // return charts.BarChart(series, animate: true);
  }
}

