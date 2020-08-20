import 'package:flutter/material.dart';
import 'package:wdc_login/screens/authenticate/sign_in.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  enabledBorder:  OutlineInputBorder(
    borderSide: BorderSide(color: const Color(0xff00AAAD), width: 2)
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: const Color(0xff00AAAD), width: 2)
  )
);


const boxDecoration = BoxDecoration (
  shape: BoxShape.rectangle,
  color: const Color(0xff00AAAD)
);

const logo = BoxDecoration (
  image: DecorationImage(
  image: const AssetImage('assests/images/logo.png'),
  fit: BoxFit.fill,
  )
);

