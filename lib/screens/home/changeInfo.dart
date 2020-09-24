import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:provider/provider.dart';
import 'package:wdc_login/models/user.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/screens/home/yourinfo.dart';
import 'package:wdc_login/services/auth.dart';
import 'package:wdc_login/services/database.dart';
import 'package:wdc_login/shared/constants.dart';
import 'package:wdc_login/shared/loading.dart';

class changeInfo extends StatefulWidget {
  @override
  _changeInfoState createState() => _changeInfoState();
}

class _changeInfoState extends State<changeInfo> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>(); //used to identify form
  bool loading = false;

  String error = "";

  String _newName;
  String _newAddress;
  String _newWasteBin;
  String _newRecBin;
  int _newUserPin;

  var txt = TextEditingController();

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream:  DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {

    if (snapshot.hasData) {
      UserData userData = snapshot.data;

      txt.text = userData.address;

      return Scaffold(
          backgroundColor: const Color(0xffffffff),
          body: Center(

              child: ListView(
                children: <Widget>[

                  Form(
                    // children: <Widget>[
                    key: _formKey,
                    //keeps track of state of form - for validation
                    child: Column( //a

                      children: <Widget>[

                        //logo - b
                        Container(
                          // margin: EdgeInsets.only(top: 0.0),
                          width: 259.0,
                          height: 195.0,
                          decoration: logo,
                        ),

                        //row c
                        Row(

                          children: <Widget>[

                            //column d
                            Column(
                              //squares - e
                                children: <Widget>[
                                  Container( //name box

                                    width: 90,
                                    height: 50,
                                    //margin: EdgeInsets.all(5.0),
                                    margin: EdgeInsets.only(
                                        bottom: 5.0, left: 5.0),
                                    decoration: boxDecoration,
                                    //how to ACTUALLY center text
                                    child: Center(
                                      child: Text(
                                        'Full Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                  Container( //address box

                                    width: 90,
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        bottom: 5.0, left: 5.0),

                                    decoration: boxDecoration,
                                    child: Center(
                                      child: Text(
                                        'Street Address',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                  Container( //User Pin box

                                    width: 90,
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        bottom: 5.0, left: 5.0),

                                    decoration: boxDecoration,
                                    child: Center(
                                      child: Text(
                                        'User Pin',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                  Container( //bin code box

                                    width: 90,
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        bottom: 5.0, left: 5.0),

                                    decoration: boxDecoration,
                                    child: Center(
                                      child: Text(
                                        'Waste Bin Code',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                  Container( //bin box

                                    width: 90,
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        bottom: 5.0, left: 5.0),

                                    decoration: boxDecoration,
                                    child: Center(
                                      child: Text(
                                        'Recycling Bin Code',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                ] //squares widget - e
                            ), //column d

                            //column f
                            Column(
                              //text boxes - g
                                children: <Widget>[

                                  Container(
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        bottom: 5.0, left: 0.0),

                                    //text field for name
                                    child: new TextFormField(
                                      initialValue: userData.name,
                                      textAlignVertical: TextAlignVertical
                                          .center,
                                      decoration: textInputDecoration,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                      onChanged: (val) {
                                        setState(() => _newName = val);
                                      },
                                    ),
                                  ), //text box

                                  //text box for address
                                  Container(
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        bottom: 5.0, left: 0.0),

                                    //start of text field for address
                                    child: new TextFormField(
                                     // initialValue: userData.address,
                                    onTap: ()async{
                                      Prediction p = await PlacesAutocomplete.show(context: context, apiKey: "AIzaSyCPVTCLkVO5gHEL7ktu8ozJh5rFwkuSK9E",
                                          mode: Mode.overlay,
                                          language: "en", components: [
                                            Component(Component.country, "nz")
                                          ]);

                                      //if an option is selected
                                      if(p != null)
                                      {
                                        print("NOT NULL");
                                        _newAddress = p.description;
                                        print(_newAddress);
                                        txt.text = _newAddress;
                                        //  controller: txt;
                                      }
                                    },
                                      textAlignVertical: TextAlignVertical.center,
                                      controller: txt,
                                      decoration: textInputDecoration,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 14,
                                        //fontWeight: FontWeight.bold,
                                      ),


                                    /*  initialValue: userData.address,
                                    textAlignVertical: TextAlignVertical
                                          .center,
                                      decoration: textInputDecoration,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 14,
                                      ),
                                      onChanged: (val) {
                                        setState(() => _newAddress = val);
                                      },*/
                                    ),
                                  ), //text box

                                  Container(
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        bottom: 5.0, left: 0.0),

                                    //start of text field for email
                                    child: new TextFormField(
                                      initialValue: userData.userPin.toString(),
                                      textAlignVertical: TextAlignVertical
                                          .center,
                                      decoration: textInputDecoration,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                      onChanged: (val) {
                                        setState(() =>
                                        _newUserPin = int.parse(val));
                                      },

                                    ),
                                  ), //text box

                                  Container(
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        bottom: 5.0, left: 0.0),

                                    //start of text field for email
                                    child: new TextFormField(
                                      initialValue: userData.wasteBin,
                                      textAlignVertical: TextAlignVertical
                                          .center,
                                      decoration: textInputDecoration,
                                      //the page/class
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                      onChanged: (val) {
                                        setState(() => _newWasteBin = val);
                                      },
                                    ),
                                  ), //text box

                                  Container(
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        bottom: 5.0, left: 0.0),

                                    //start of text field for email
                                    child: new TextFormField(
                                      initialValue: userData.recBin,
                                      textAlignVertical: TextAlignVertical
                                          .center,
                                      decoration: textInputDecoration,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                      onChanged: (val) {
                                        setState(() => _newRecBin = val);
                                      },
                                    ),
                                  ), //text box
                                ] //g widget
                            ) //column f

                          ], //c row widget
                        ), //row c

                        SizedBox(height: 12.0),
                        Text(
                            error,
                            style: TextStyle(color: Colors.red)),
                        //button: h
                        Container(
                          width: 300.0,
                          height: 50.0,
                          margin: const EdgeInsets.only(top: 20.0),

                          child:
                          RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.white,
                            color: HexColor("#00AAAD"),
                            //get actual colour
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: new Text("SAVE",
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () async {
                              if(_formKey.currentState.validate()) {
                                await DatabaseService(uid: user.uid).updateUserData(
                                    _newName ?? userData.name,
                                    _newAddress ?? snapshot.data.address,
                                    _newWasteBin ?? snapshot.data.wasteBin,
                                    _newRecBin ?? snapshot.data.recBin,
                                    _newUserPin ?? snapshot.data.userPin,
                                    snapshot.data.waste1,
                                  snapshot.data.waste2,
                                  snapshot.data.waste3
                                );
                              }
                              Navigator.pop(context);
                            },
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
                              MaterialPageRoute(builder: (context) => YourInfo()),
                            );},
                          ),
                        ),
                      ], //a widget
                    ),
                    // ],
                  ) //a column
                ], //listview widget
              ) //makes it scrollable
          )
      );
    }
    else{ return Loading(); }
      }
    );
  }
}
