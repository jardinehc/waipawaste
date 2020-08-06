import 'package:firebase_auth/firebase_auth.dart';
import 'package:wdc_login/models/user.dart';

class AuthService {
  //all different methods thats interact to sign in

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    //if the user isnt null then set the user id to the uid
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream (when ever user changes)
  Stream<User> get user {
    // a stream of users
    return _auth.onAuthStateChanged
        .map(
        _userFromFirebaseUser); //passes the user we get down the stream into this
  }


  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth
          .signInAnonymously(); //will return an auth result object
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in w/ email and password

  Future signInWithEmailAndPassword(String email, String password) async
  {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password); //firebase method
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e);
    }
  }


  //register w/ email and password
  Future registerWithEmailAndPassword(String email, String password) async
    {
      try {
        AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password); //firebase method
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);
      }
      catch(e) {
        print(e);
      }
  }


  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
    }
  }
}