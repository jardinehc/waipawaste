import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wdc_login/models/user.dart';
import 'package:wdc_login/screens/wrapper.dart';
import 'package:wdc_login/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value( //listening to the stream
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}


