
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wdc_login/models/user.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/screens/home/changeInfo.dart';
import 'package:wdc_login/screens/home/data_list.dart';
import 'package:wdc_login/screens/home/home.dart';
import 'package:wdc_login/services/database.dart';
import 'package:wdc_login/shared/constants.dart';
import 'package:wdc_login/models/user.dart';
import 'package:wdc_login/shared/loading.dart';

class YourInfo extends StatefulWidget {
  @override
  _YourInfoState createState() => _YourInfoState();
}

class _YourInfoState extends State<YourInfo> {
  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }


//class YourInfo extends StatelessWidget {
//  YourInfo({
//    Key key,
//  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return StreamProvider<QuerySnapshot>.value (
    // value: DatabaseService().userInfos,

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) { //snapshot of data coming down the stream

          //print(user.uid);
          //check theres actually data first
          if (snapshot.hasData) {

            UserData userData = snapshot.data;


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
                                              new Text(
                                                'Welcome ${userData.name}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                              ),

                                              new Text(
                                                '\nChange your details if anything has changed,\nyou have moved or recieved new bins',
                                                //textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.black),
                                              ),
                                            ]
                                        ),

                                        //button
                                        Container(
                                          margin: const EdgeInsets.only(left: 25.0),
                                          child: IconButton (

                                            icon: Icon(Icons.arrow_forward),
                                            color: Colors.black, onPressed: () { Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => changeInfo()),
                                          ); },
                                          ),
                                        ),
                                      ]

                                  ), //d

                                ),

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
          else {
            return Loading();
          }

          // return Container();


        }
    );
    // );
  }
}



