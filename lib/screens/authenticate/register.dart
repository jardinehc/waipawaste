import 'package:flutter/material.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';
import 'package:wdc_login/services/auth.dart';
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
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage('assests/images/logo.png'),
                              fit: BoxFit.fill,
                            ),
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
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: HexColor("#00AAAD"),
                                    ),
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

                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: HexColor("#00AAAD"),
                                    ),
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

                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: HexColor("#00AAAD"),
                                    ),
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

                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: HexColor("#00AAAD"),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Street Address',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                  Container( //suburb box

                                    width: 90,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 5.0),

                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: HexColor("#00AAAD"),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Suburb',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),

                                  Container( //bin code box

                                    width: 90,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 5.0),

                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: HexColor("#00AAAD"),
                                    ),
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

                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: HexColor("#00AAAD"),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Recycling Bin Code',
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
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: new InputDecoration(
                                        fillColor: Colors.white,
                                        enabledBorder: new OutlineInputBorder(
                                          //  borderRadius: new BorderRadius.circular(25.0),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                      ),
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  ), //text box

                                  Container (
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                    //start of text field for email
                                    child: new TextFormField(
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: new InputDecoration(
                                        fillColor: Colors.white,
                                        enabledBorder: new OutlineInputBorder(
                                          //  borderRadius: new BorderRadius.circular(25.0),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                      ),
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
                                      decoration: new InputDecoration(
                                        fillColor: Colors.white,
                                        enabledBorder: new OutlineInputBorder(
                                          //  borderRadius: new BorderRadius.circular(25.0),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                      ),
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

                                    //start of text field for email
                                    child: new TextFormField(
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: new InputDecoration(
                                        fillColor: Colors.white,
                                        enabledBorder: new OutlineInputBorder(
                                          //  borderRadius: new BorderRadius.circular(25.0),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                      ),
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  ), //text box

                                  Container (
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                    //start of text field for email
                                    child: new TextFormField(
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: new InputDecoration(
                                        fillColor: Colors.white,
                                        enabledBorder: new OutlineInputBorder(
                                          //  borderRadius: new BorderRadius.circular(25.0),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                      ),
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),

                                    ),
                                  ), //text box

                                  Container (
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                    //start of text field for email
                                    child: new TextFormField(
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: new InputDecoration(
                                        fillColor: Colors.white,
                                        enabledBorder: new OutlineInputBorder(
                                          //  borderRadius: new BorderRadius.circular(25.0),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                      ),
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  ), //text box

                                  Container (
                                    width: 300,
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 5.0, left: 0.0),

                                    //start of text field for email
                                    child: new TextFormField(
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: new InputDecoration(
                                        fillColor: Colors.white,
                                        enabledBorder: new OutlineInputBorder(
                                          //  borderRadius: new BorderRadius.circular(25.0),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          // borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                                        ),
                                      ),
                                      style: new TextStyle(
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  ), //text box


                                ] //g widget
                            ) //column f

                          ], //c row widget
                        ), //row c

                        SizedBox(height: 12.0), //just an error output
                        Text (
                            error,
                            style: TextStyle(color: Colors.red)),
                        //button: h
                        Container(
                          width: 300.0,
                          height: 50.0,
                          margin: const EdgeInsets.only(top: 20.0, bottom: 10),

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
                                  dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                  if(result == null)
                                    {
                                      setState(() => loading = false);
                                      setState(() => error = 'Please provide a valid email');
                                    }
                                }
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












    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Sign up'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign in'),
              onPressed: () {
                widget.toggleView(); //reverses the sign in and reg pages view
              },
            ),
          ],
        ),
        body: Container (
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey, //keeps track of state of form - for validation
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField( //email
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField( //password
                      obscureText: true,
                      validator: (val) => val.length < 6 ? 'Enter a password greater than 6 chars' : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton( //reg button
                      color: Colors.pink,
                      child: Text('Sign up', style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {

                        if(_formKey.currentState.validate()) //valid or invalid form
                          {
                            dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                            if(result == null)
                              {
                                setState(() => error = 'please provide a valid email');
                              }
                          }
                      },
                    ),
                    SizedBox(height: 12.0), //just an error output
                    Text (
                        error,
                    style: TextStyle(color: Colors.red)),
                  ],
                )
            )
        )
    );
  }
}
