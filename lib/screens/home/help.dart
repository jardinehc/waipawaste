import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/screens/home/home.dart';
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
          ), //end of logo

          Container(

          //    children: <Widget>[
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(15.0),

            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              shape: BoxShape.rectangle,
              color: HexColor("#E3F6F6"),
            ),

            child: Row(

              children:<Widget> [

            new Text(
                  '\nChange your details if anything has changed,\nyou have moved or recieved new bins',
                  //textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),


          ]  ),
      //  ]
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
      ]
    ),
   ] ),
    ),
    );
  }
}
