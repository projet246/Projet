import 'package:firebase_auth/firebase_auth.dart';
import 'package:sorttrash/BackEnd/AuthService/user_info.dart';

import '../../main.dart';


class AuthService {
  bool error = false;
  String errorMessage = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserInfos? _userfromfirebaseUser( User? user ){ /// this is a method to get user uid from a FirebaseUser to use to login
    return user != null ? UserInfos(uid: user.uid) : null;
  }
  Stream<UserInfos?> get user { /// A stream of UserInfos objects are returned by the code's defined getter function.
    return _auth.authStateChanges()
        .map(_userfromfirebaseUser); /// the map method is used to transform each event in the stream of authentication state changes, from FireBaseUser to UserInfos
  }
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userfromfirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future logIn( String email, String password ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email, password: password);
    }
    on FirebaseAuthException catch (e) {
      print(e.toString());
      error  = true;
      errorMessage = e.toString();
    }
    if (FirebaseAuth.instance.currentUser!.emailVerified){
      navigatorKey.currentState!.pushNamed('/VerifyUserEmail');
    }else {
      if (!error) {
        navigatorKey.currentState!.pushNamed('/');
      }
    }
  }

  Future registerWithEmail( String email, String password ) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email, password: password);
    }
    on FirebaseAuthException catch (e) {
      print(e);
      error  = true;
    }
    if ( !error  ) {
      navigatorKey.currentState!.pushReplacementNamed('/VerifyUserEmail');
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}