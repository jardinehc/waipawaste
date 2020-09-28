import 'package:firebase_auth/firebase_auth.dart';
import 'package:wdc_login/models/user.dart';
import 'package:wdc_login/services/database.dart';

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
  Future registerWithEmailAndPassword(String email, String password, String name, String address, String wasteBin, String recBin, String houseType, int userPin, int waste1, int waste2, int waste3) async
    {
      try {
        AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password); //firebase method
        FirebaseUser user = result.user;

        //create new document for the new user
        await DatabaseService(uid: user.uid).updateUserData(name, address, wasteBin, recBin, houseType, userPin, waste1, waste2, waste3);

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
      return null;
    }
  }
}