
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wdc_login/shared/constants.dart';

import 'authenticate/sign_in.dart';


class Tips extends StatelessWidget {
  Tips({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(

            child: ListView(
                children: <Widget>[

                  //1. Column         a
                  //1. LOGO         b
                  //2. Boxes        c
                  //1. Row        d
                  //1. text     e
                  //2. button   f

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

                          child: Row( //row d

                              children:<Widget> [

                                Column(

                                    children: <Widget>[
                                      new Text(
                                        'Weekly Update',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                      ),

                                      new Text(
                                        '\nThis past week Waipa recycled 20,380 cans.\n This is enough to create 10,000 new cans.',
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

                        //box 2
                        Container( //boxes c

                          margin: EdgeInsets.only(left: 15.0, top: 0.0, right: 15.0, bottom: 15.0),
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
                                        'What can and can not be recycled?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                      new Text(
                                        '\nSpecific information about the ins and outs of\nrecyclable materials',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ]
                                ),
                                //button
                                Container(
                                  margin: const EdgeInsets.only(left: 15.0),
                                  child: IconButton (

                                    icon: Icon(Icons.arrow_forward),
                                    color: Colors.black, onPressed: () {  },
                                  ),
                                )
                              ]
                          ), //d
                        ), //end of 2nd box,

                        //box 3
                        Container( //boxes c

                          margin: EdgeInsets.only(left: 15.0, top: 0.0, right: 15.0, bottom: 15.0),
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
                                        'How to properly sort recycling',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                      new Text(
                                        '\nLearn how to clean your recycling. Is this\nbroken or small object able to be recycled?',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ]
                                ),
                                //button
                                Container(
                                  margin: const EdgeInsets.only(left: 30.0),
                                  child: IconButton (
                                    icon: Icon(Icons.arrow_forward),
                                    color: Colors.black, onPressed: () {  },
                                  ),
                                )
                              ]
                          ), //d
                        ), //end of 3rd box

                        //box 4
                        Container( //boxes c

                          margin: EdgeInsets.only(left: 15.0, top: 0.0, right: 15.0, bottom: 15.0),
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
                                        'Recyling Milestones',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                      new Text(
                                        '\nAwesome things we have achieved recently\nthrough recyling. We should all be proud.',
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
                        ), //end of 4th box

                        //box 5
                        Container( //boxes c

                          margin: EdgeInsets.only(left: 15.0, top: 0.0, right: 15.0, bottom: 15.0),
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
                                        'Update from WDC',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                      new Text(
                                        '\nThere are changes in the WDC office.\nLearn more about who and what is changing.',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ]
                                ),
                                //button
                                Container(
                                  margin: const EdgeInsets.only(left: 15.0),
                                  child: IconButton (
                                    icon: Icon(Icons.arrow_forward),
                                    color: Colors.black, onPressed: () {  },
                                  ),
                                )
                              ]
                          ), //d
                        ) //end of 4th box


                        //c boxes
                      ] //a widget
                  )//column a


                ]
            )
        )
    );
  }

}

