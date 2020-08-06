import 'package:flutter/material.dart';
import 'package:wdc_login/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}
//TODO so i finished it - it should sign in with test@testing.com testing
//but like the avd died so i guess work that out then try it
//https://www.youtube.com/watch?v=Jy82t4IKJSQ

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>(); //used to identify form

  //text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toggleView();
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
              RaisedButton(
                color: Colors.pink,
                child: Text('Sign in', style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {

                  if(_formKey.currentState.validate()) //valid or invalid form
                      {
                       dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null)
                       {
                         setState(() => error = 'credentials are wrong');
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
