import 'package:flutter/material.dart';
import 'package:wdc_login/services/auth.dart';
import 'package:wdc_login/shared/constants.dart';
import 'package:wdc_login/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>(); //used to identify form
  bool loading = false;

  //text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {

    return loading ? Loading() : Scaffold( //if loading is true then show loading screen otherwise this screen
      backgroundColor: const Color(0xffffffff),

      body: Container(

        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey, //keeps track of state of form - for validation

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[

                  // logo
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    width: 259.0,
                    height: 195.0,
                    //alignment: Alignment.center,
                    decoration: logo,
                  ),

                  Container (
                   // margin: EdgeInsets.only(top: 50, left: 30),
                    margin: EdgeInsets.only(top: 50),
                    child: Text(
                      'Log in to your existing WDC Waste\n   account or register a new one',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),

                  //email text box
                  Container (
                    //margin: EdgeInsets.only(top: 50, left: 30),
                    margin: EdgeInsets.only(top: 50),
                    width: 350,
                    height: 50,

                    //start of text field for email
                    child: new TextFormField(
                      //textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,

                      decoration: new InputDecoration(
                        // labelText: "Enter Email",

                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: 16),

                        fillColor: Colors.white,
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                        ),
                      ),

                      //validator
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val); },

                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),

                  //text field for password
                  Container (
                    width: 350,
                    height: 50,
                   // margin: EdgeInsets.all(5.0),
                    margin: EdgeInsets.only(top: 5),

                    child: new TextFormField(
                      obscureText: true,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: new InputDecoration(

                        hintText: "Password",
                        fillColor: Colors.white,
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(color: HexColor("#00AAAD"), width: 2),
                        ),
                      ),
                      validator: (val) => val.length < 6 ? 'Enter a password greater than 6 chars' : null,
                      onChanged: (val) {
                      setState(() => password = val); },

                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),


                  //continue button
                  Container(
                    width: 300.0,
                    height: 50.0,
                    margin: const EdgeInsets.only(top: 60.0),

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
                      //onPressed: validateAndSubmit,
                      onPressed: () async {

                      if(_formKey.currentState.validate()) //valid or invalid form
                          {
                            //show loading screen
                            setState(() => loading = true);
                           dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                            if(result == null)
                           {
                             setState(() => loading = false);
                             setState(() => error = 'Unable to log in');
                           }
                      }
                    },
                    ),
                  ),

                  //register button
                  Container( //container so i can set the margin
                    width: 300.0,
                    height: 50.0,
                    margin: const EdgeInsets.only(top: 10.0),

                    child: RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.black,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: HexColor("#00AAAD"), width: 2),
                          borderRadius: BorderRadius.circular(25)),
                      child: new Text("Register",
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        widget.toggleView();
                      },
                    ),
                  ),
                  Container(height: 10)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//to be able to use hex colours
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
