import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wdc_login/shared/constants.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Center(

      child: ListView(
      children: <Widget>[

        Column(

         children: <Widget>[

          Container(
      // margin: EdgeInsets.only(top: 0.0),
          width: 259.0,
          height: 195.0,
          decoration: logo,
          ),//end of logo
        ]
      ),
      ]
    ),
    ),
    );
  }
}
