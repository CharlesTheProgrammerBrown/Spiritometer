import 'package:firebase_auth/firebase_auth.dart';
import 'package:spiritometer/models/user.dart';
//import 'package:flutter/material.dart';

//define methods to interact with Firebase Auth
class AuthService{
  
//instance of Firebase auth to communicate with firebase on backend
final FirebaseAuth _auth = FirebaseAuth.instance;

//create user obj based on FirebaseUser

User _userFromFirebaseUser(FirebaseUser user){
  return user!=null? User(uid:user.uid): null;
}

/*auth change user stream
gets stream of FirebaseUser everytime users sign in
Stream<FirebaseUser> get user{
  return _auth.onAuthStateChanged;
}
*/

//change type to User cos of map to normal user
Stream<User> get user{
  return _auth.onAuthStateChanged 
  //get stream of Firebase User & return stream of normal user 
  //.map((FirebaseUser user) => _userFromFirebaseUser(user));
  .map(_userFromFirebaseUser);
}
 

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

Future registerWithEmailAndPassword(String email, String password) async{
try {
  AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);

//grab user from result
FirebaseUser user = result.user;

//turn FirebaseUser with multiple info to user class created wit jst ID
return _userFromFirebaseUser(user);
} catch (e) {
  print(e.toString());
  return null;
}

}

//method to sign out
}
