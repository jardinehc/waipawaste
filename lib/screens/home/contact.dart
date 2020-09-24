import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/shared/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {

    String message;
    String name;
    String email;

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
                              'Thank you for taking the time to test out this\napplication.'
                                  ' If you have any comments or suggestions \nI would love to receive them.'
                                  ' Please use the contact\nform below or alternatively email Jardine at\njardine.chapman@gmail.com',
                              //textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),


                          ]
                      ),
                    ),
                    //row c
                    Row (

                      children: <Widget>[

                        //column d
                        Column(
                          //squares - e
                            children: <Widget> [
                              Container( //name box

                                width: 90,
                                height: 50,
                                //margin: EdgeInsets.all(5.0),
                                margin: EdgeInsets.only(bottom: 5.0, left: 5.0),
                                decoration: boxDecoration,
                                //how to ACTUALLY center text
                                child: Center(
                                  child: Text(
                                    'Name',
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),

                              Container( //email box

                                width: 90,
                                height: 50,
                                // margin: EdgeInsets.all(5.0),
                                margin: EdgeInsets.only(bottom: 5.0, left: 5.0),

                                decoration: boxDecoration,
                                child: Center(
                                  child: Text(
                                    'Email',
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),

                              Container( //message box

                                width: 90,
                                height: 50,
                                margin: EdgeInsets.only(bottom: 5.0, left: 5.0),

                                decoration: boxDecoration,
                                child: Center(
                                  child: Text(
                                    'Message',
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ] //squares widget - e
                        ), //column d

                        //column f
                        Column(
                          //text boxes - g
                            children: <Widget> [

                              //name
                              Container (
                                width: 300,
                                height: 50,
                                margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                //text field for name
                                child: new TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: textInputDecoration,
                                  style: new TextStyle(
                                    fontFamily: "Poppins",
                                  ),
                                  onChanged: (val) {
                                    setState(() => name = val);
                                  },
                                ),
                              ), //text box

                              //email
                              Container (
                                width: 300,
                                height: 50,
                                margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                //start of text field for email
                                child: new TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: textInputDecoration,
                                  keyboardType: TextInputType.emailAddress,
                                  style: new TextStyle(
                                    fontFamily: "Poppins",
                                  ),
                                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                ),
                              ), //text box

                              //message
                              Container (
                                width: 300,
                                height: 50,
                                margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                //start of text field for message
                                child: new TextFormField(

                                  maxLines: null,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: textInputDecoration,
                                  style: new TextStyle(
                                    fontFamily: "Poppins",
                                  ),
                                  onChanged: (val) {
                                    setState(() => message = val);
                                  },
                                ),
                              ), //text box
                            ] //g widget
                        ) //column f

                      ], //c row widget
                    ), //row c

                    SizedBox(height: 12.0),
                    //button: h
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
                            borderRadius: BorderRadius.circular(25)),
                        child: new Text("SEND",
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () => _launchURL('jardine.chapman@gmail.com', 'Query from Waipa Waste from $name', "$message reply email: $email"),
                      ),
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

  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


