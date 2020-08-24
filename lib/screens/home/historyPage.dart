import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/screens/home/history.dart';
import 'package:wdc_login/shared/constants.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'home.dart';

class HisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

                          child: Row( //row d

                              children:<Widget> [

                                Column(

                                    children: <Widget>[

                                      //graph in here
                                      new Sparkline(
                                        data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
                                        lineColor: Color(0xffff6101),
                                        pointsMode: PointsMode.all,
                                        pointSize: 8.0,
                                      ),

                                    ]
                                ),


                              ]
                          ), //d
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
        )

    );
  }
}
