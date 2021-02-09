import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wdc_login/models/user.dart';
import 'package:wdc_login/screens/authenticate/authenticate.dart';
import 'package:wdc_login/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //dynamically change what the user sees based on authentcation
    //using streams to listen for authentication

    //return either home or authenticate widget
    if(user == null) //no user signed in
      {
      return Authenticate();
      }
    else //valid user
      {
        return Home();
      }

  }
}
