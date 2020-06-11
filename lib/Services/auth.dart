import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//define methods to interact with Firebase Auth
class AuthService{
  
//instance of Firebase auth to communicate with firebase on backend
final FirebaseAuth _auth = FirebaseAuth.instance;

//sign in with email and password
Future signInEmail() async{

  try{
   AuthResult result= await _auth.signInWithEmailAndPassword(email: null, password: null);
   FirebaseUser user = result.user;
   return user;
  } catch(e){

    print(e.toString());
    return null;
  }
}
//register with email and password

//method to sign out
}
