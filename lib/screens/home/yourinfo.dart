
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



class YourInfo extends StatelessWidget {
  YourInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value (
      value: DatabaseService().userInfos,

      child: Scaffold(
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


                          //box 1
                          Container( //boxes c

                            margin: EdgeInsets.all(15.0),
                            padding: EdgeInsets.all(15.0),

                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              shape: BoxShape.rectangle,
                              color: HexColor("#E3F6F6"),
                            ),

                          ),

                          dataList(),
          ]
          )
          ]
      )
          )

      ),
    );
  }

}

