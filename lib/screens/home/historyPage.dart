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

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {

        if(snapshot.hasData)
          {
            UserData userData = snapshot.data;

            final List<WeightsSeries> data = [
              WeightsSeries(
                date: "3 AGO",
                weight: userData.waste3,
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

                                  margin: EdgeInsets.all(15.0),
                                  padding: EdgeInsets.all(15.0),

                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shape: BoxShape.rectangle,
                                    color: HexColor("#E3F6F6"),
                                  ),

                                  child: WeightChart(
                                    data: data,
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

