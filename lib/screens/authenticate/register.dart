import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/services/auth.dart';
import 'package:wdc_login/shared/constants.dart';
import 'package:wdc_login/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>(); //used to identify form
  bool loading = false;

  //text field state
  String email = "";
  String password = "";
  String error = "";

  String name = "";
  String address = "";
  String wasteBin = "";
  String recBin = "";
  int userPin = null;
  String houseType = "";

  var txt = TextEditingController();

  List<String> _houseTypes = <String>['', 'Young Couple (no kids)', 'Older Couple (no kids)', 'Family with Children under 5 years',
    'Family with Children over 5 years', 'Group Living (flatting)', 'Singular Occupant'];


  @override
  Widget build(BuildContext context) {

    return loading ? Loading() : Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(

            child: ListView(
              children: <Widget>[

                //column              a
                //1. logo          b
                //2.  row           c

                //1. column       d
                //1. squares    e
                //2. column       f
                //1. text boxes g
                //3. button         h

                Form(
                 // children: <Widget>[
                  key: _formKey, //keeps track of state of form - for validation
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
                                        'Full Name',
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

                                  Container( //password box

                                    width: 90,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 5.0),

                                    decoration: boxDecoration,
                                    child: Center(
                                      child: Text(
                                        'Password',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Container( //address box

                                    width: 90,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 5.0),

                                    decoration: boxDecoration,
                                    child: Center(
                                      child: Text(
                                        'Home Address',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                  Container( //suburb box

                                    width: 90,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 5.0),

                                    decoration: boxDecoration,
                                    child: Center(
                                      child: Text(
                                        'User Pin',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                  Container( //bin code box

                                    width: 90,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 5.0),

                                    decoration: boxDecoration,
                                    child: Center(
                                      child: Text(
                                        'Waste Bin Code',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                  Container( //bin box

                                    width: 90,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 5.0),

                                    decoration: boxDecoration,
                                    child: Center(
                                      child: Text(
                                        'House Type',
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

                                  Container (
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                    //text field for name
                                    child: new TextFormField(
                                      textCapitalization: TextCapitalization.words,
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

                                  Container (
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                    //start of text field for email
                                    child: new TextFormField(
                                      textCapitalization: TextCapitalization.none,
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

                                  Container (
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                    //start of text field for password
                                    child: new TextFormField(
                                      obscureText: true,
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: textInputDecoration,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                      validator: (val) => val.length < 6 ? 'Enter a password greater than 6 chars' : null,
                                      onChanged: (val) {
                                        setState(() => password = val);
                                      },
                                    ),
                                  ), //text box

                                  Container (
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                    //start of text field for address
                                    child: new TextFormField(

                                      onTap: ()async{ //for autocomplete
                                        Prediction p = await PlacesAutocomplete.show(context: context, apiKey: "AIzaSyCPVTCLkVO5gHEL7ktu8ozJh5rFwkuSK9E",
                                            mode: Mode.overlay,
                                            language: "en", components: [
                                          Component(Component.country, "nz")
                                            ]);
                                        //if an option is selected
                                        if(p != null)
                                          {
                                            print("NOT NULL");
                                            address = p.description;
                                            print(address);
                                            txt.text = address;
                                          //  controller: txt;
                                          }
                                      },
                                      textAlignVertical: TextAlignVertical.center,
                                      controller: txt,
                                      decoration: textInputDecoration,
                                  /*    decoration: InputDecoration(
                                        //labelText: address,
                                          fillColor: Colors.white,
                                          enabledBorder:  OutlineInputBorder(
                                              borderSide: BorderSide(color: const Color(0xff00AAAD), width: 2)
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: const Color(0xff00AAAD), width: 2)
                                          )
                                      ),*/
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 14, //14
                                        //fontWeight: FontWeight.bold,
                                      ),
                                 /*     onChanged: (val)  {
                                        setState(() => address = val);
                                        //print(address);
                                      },*/
                                    ),
                                  ), //text box

                                  Container (
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                    //start of text field for user pin
                                    child: new TextFormField(
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: textInputDecoration,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                      onChanged: (val) {
                                        setState(() => userPin = int.parse(val));
                                      },

                                    ),
                                  ), //text box

                                  Container (
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                    //start of text field for waste bin
                                    child: new TextFormField(
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: textInputDecoration,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                      onChanged: (val) {
                                        setState(() => wasteBin = val);
                                      },
                                    ),
                                  ), //text box

                           /*       Container (
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                    //start of text field for rec bin
                                    child: new TextFormField(
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: textInputDecoration,
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                      onChanged: (val) {
                                        setState(() => recBin = val);
                                      },
                                    ),
                                  ), *///text box

                                  //trialling house type
                                  Container (
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                    //start of text field for house type
                                    child: FormField(
                                    builder: (FormFieldState state) {
                                      return InputDecorator(
                                        decoration: textInputDecoration,
                                        child: new DropdownButtonHideUnderline(
                                          child: new DropdownButton(
                                            value: houseType,
                                            isDense: true,
                                            onChanged: (val) {
                                              setState(() {
                                                houseType = val;
                                              });
                                            },
                                            items: _houseTypes.map((
                                                String value) {
                                              return new DropdownMenuItem(
                                                value: value,
                                                child: new Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      );
                                    }
                                    )
                                  ),
                                ] //g widget
                            ) //column f

                          ], //c row widget
                        ), //row c

                        SizedBox(height: 12.0),
                        Text (
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
                            color: HexColor("#00AAAD"), //get actual colour
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: new Text("CONTINUE",
                              style: TextStyle(fontSize: 18),
                            ),
                           onPressed: () async {
                              if(_formKey.currentState.validate()) //valid or invalid form
                                {
                                setState(() => loading = true);
                                  dynamic result = await _auth.registerWithEmailAndPassword(email, password, name, address, wasteBin, recBin, houseType, userPin, 0, 0, 0);
                                  if(result == null)
                                    {
                                      setState(() => loading = false);
                                      setState(() => error = 'Please provide a valid email');
                                    }
                                }
                            },
                          ),
                        ),
                        Container(
                          width: 300.0,
                          height: 50.0,
                          margin: const EdgeInsets.only(top: 5.0, bottom: 10),

                          child: RaisedButton(
                            padding: const EdgeInsets.all(8.0),
                            textColor: Colors.black,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                borderRadius: BorderRadius.circular(25)),
                            child: new Text("BACK",
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              widget.toggleView();
                            },
                          ),
                        ),
                      ],//a widget
                    ),
                 // ],
                ) //a column
              ], //listview widget
            )  //makes it scrollable
        )
    );












//    return Scaffold(
//        backgroundColor: Colors.brown[100],
//        appBar: AppBar(
//          backgroundColor: Colors.brown[400],
//          elevation: 0.0,
//          title: Text('Sign up'),
//          actions: <Widget>[
//            FlatButton.icon(
//              icon: Icon(Icons.person),
//              label: Text('Sign in'),
//              onPressed: () {
//                widget.toggleView(); //reverses the sign in and reg pages view
//              },
//            ),
//          ],
//        ),
//        body: Container (
//            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//            child: Form(
//              key: _formKey, //keeps track of state of form - for validation
//                child: Column(
//                  children: <Widget>[
//                    SizedBox(height: 20.0),
//                    TextFormField( //email
//                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
//                      onChanged: (val) {
//                        setState(() => email = val);
//                      },
//                    ),
//                    SizedBox(height: 20.0),
//                    TextFormField( //password
//                      obscureText: true,
//                      validator: (val) => val.length < 6 ? 'Enter a password greater than 6 chars' : null,
//                      onChanged: (val) {
//                        setState(() => password = val);
//                      },
//                    ),
//                    SizedBox(height: 20.0),
//                    RaisedButton( //reg button
//                      color: Colors.pink,
//                      child: Text('Sign up', style: TextStyle(color: Colors.white),
//                      ),
//                      onPressed: () async {
//
//                        if(_formKey.currentState.validate()) //valid or invalid form
//                          {
//                            dynamic result = await _auth.registerWithEmailAndPassword(email, password);
//                            if(result == null)
//                              {
//                                setState(() => error = 'please provide a valid email');
//                              }
//                          }
//                      },
//                    ),
//                    SizedBox(height: 12.0), //just an error output
//                    Text (
//                        error,
//                    style: TextStyle(color: Colors.red)),
//                  ],
//                )
//            )
//        )
//    );
  }
}
