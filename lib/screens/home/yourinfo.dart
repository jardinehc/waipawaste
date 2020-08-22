
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wdc_login/models/user.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/screens/home/data_list.dart';
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

          print(user.uid);
          //check theres actually data first
          if (snapshot.hasData) {
           // if(user.uid != null) {
            print("has data");
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
                                            color: Colors.black, onPressed: () {  },
                                          ),
                                        )

                                      ]

                                  ), //d

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



