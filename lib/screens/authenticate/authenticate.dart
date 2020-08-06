import 'package:flutter/material.dart';
import 'package:wdc_login/screens/authenticate/register.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {

    if(showSignIn)
      {
      return SignIn(toggleView: toggleView); //it directs to the sign in  page. This is the entry point
        }
    else {
      return Register(toggleView: toggleView);
    }
  }
}