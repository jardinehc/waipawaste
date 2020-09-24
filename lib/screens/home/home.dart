import 'package:flutter/material.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/screens/home/RInfo.dart';
import 'package:wdc_login/screens/home/help.dart';
import 'package:wdc_login/screens/home/history.dart';
import 'package:wdc_login/screens/home/historyPage.dart';
import 'package:wdc_login/screens/home/regionalInfo.dart';
import 'package:wdc_login/screens/home/yourinfo.dart';
import 'package:wdc_login/screens/tips.dart';
import 'package:wdc_login/services/auth.dart';
import 'package:wdc_login/services/database.dart';
import 'package:wdc_login/shared/constants.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(

            child: ListView(
                children: <Widget>[

                  //1. Column        a
                  //1. LOGO        b
                  //2. Buttons     c
                  //3. Texts       d

                  //1. a Column
                  Column(

                      children: <Widget>[
                        //logo - b
                        Container(
                          // margin: EdgeInsets.only(top: 0.0),
                          width: 259.0,
                          height: 195.0,
                         decoration: logo,
                        ), //end of logo container

                        //buttons: c

                        //your info button
                        Container(
                          width: 300.0,
                          height: 50.0,
                          margin: const EdgeInsets.only(top: 20.0),

                          child:
                          RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            color: HexColor("#00AAAD"), //get actual colour
                            //shape: RoundedRectangleBorder(
                            //  borderRadius: BorderRadius.circular(25)),
                            child: new Text("PAST COLLECTIONS",
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HisPage()),
                            );
                            },
                          ),
                        ),

                        //waipa info
                        Container(
                          width: 300.0,
                          height: 50.0,
                          margin: const EdgeInsets.only(top: 20.0),

                          child:
                          RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            color: HexColor("#00AAAD"),
                            child: new Text("WAIPA INFO",
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RInfo()),
                              );
                            }
                          ),
                        ),

                        //HELPFUL TIPS
                        Container(
                          width: 300.0,
                          height: 50.0,
                          margin: const EdgeInsets.only(top: 20.0),

                          child:
                          RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            color: HexColor("#00AAAD"), //get actual colour
                            //shape: RoundedRectangleBorder(
                            //  borderRadius: BorderRadius.circular(25)),
                            child: new Text("NOTIFICATIONS",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Tips()),
                              );
                            },
                          ),
                        ),

                        //HISTORY
                        Container(
                          width: 300.0,
                          height: 50.0,
                          margin: const EdgeInsets.only(top: 20.0),

                          child:
                          RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            color: HexColor("#00AAAD"), //get actual colour
                            //shape: RoundedRectangleBorder(
                            //  borderRadius: BorderRadius.circular(25)),
                            child: new Text("SETTINGS",
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => YourInfo()),
                              );
                            },
                          ),
                        ),

                        //HELP
                        Container(
                          width: 300.0,
                          height: 50.0,
                          margin: const EdgeInsets.only(top: 20.0),

                          child:
                          RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            color: HexColor("#00AAAD"), //get actual colour
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: new Text("HELP",
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Help()),
                              );
                            },
                          ),
                        ),

                        //TEXTS
                        Container( //collection day box
                          width: 200,
                          height: 50,
                          margin: EdgeInsets.only(top: 10.0),

                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            border: Border.all(
                              color: HexColor("#00AAAD"),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'YOUR COLLECTION DAY IS TUESDAY',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        //TEXTS
                        Container( //collection day box
                          margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0, bottom: 15.0),

                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            border: Border.all(
                              color: HexColor("#00AAAD"),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                'This weeks focus is on recycling your cans. Remember to wash out your tin cans before placing them in your recycling bin',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),

                          ),
                        ),


                        //LOGOUT
                        Container(
                          width: 200.0,
                          height: 50.0,
                          margin: const EdgeInsets.only(top: 20.0, bottom: 10),

                          child:
                          RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            color: HexColor("#00AAAD"), //get actual colour
                            //shape: RoundedRectangleBorder(
                            //  borderRadius: BorderRadius.circular(25)),
                            child: new Text("LOGOUT",
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () async {
                              await _auth.signOut(); },
                          ),
                        ),

                      ]

                  )

                ]
            )
        )
    );













//    return Scaffold(
//      backgroundColor: Colors.brown[50],
//      appBar: AppBar(
//        title: Text('Home'),
//        backgroundColor: Colors.brown[400],
//        elevation: 0.0,
//          actions: <Widget>[
//            FlatButton.icon(
//              icon: Icon(Icons.person),
//              label: Text('logout'),
//              onPressed: () async {
//                await _auth.signOut();
//              },
//            ),
//          ],
//      ),
//    );
  }
}
