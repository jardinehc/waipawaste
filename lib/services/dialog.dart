import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wdc_login/screens/home/contact.dart';
import 'package:wdc_login/screens/home/home.dart';

class BlurryDialog extends StatelessWidget {

  String title;
  String content;
  VoidCallback continueCallBack;
  bool isError;

  BlurryDialog(this.title, this.content, this.continueCallBack, this.isError);
  TextStyle textStyle = TextStyle (color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child:  AlertDialog(
          title: new Text(title,style: textStyle,),
          content: new Text(content, style: textStyle,),
          actions: <Widget>[
            new FlatButton(
              child: Text("Back"),
              onPressed: () {
               // Navigator.of(context).pop();
                if(isError)
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Contact()));
                  }
                else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()));
                }
              },
            ),
          ],

          elevation: 24.0,

        ));
  }
}