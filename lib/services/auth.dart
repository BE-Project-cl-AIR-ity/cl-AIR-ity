import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_clairity/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance; 

  //create user object based on firebase user

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }


 // auth change user stream
 Stream<User> get user{
   return _auth.onAuthStateChanged
   .map(_userFromFirebaseUser);
 }

 // sign in anom
 Future signInAnom() async{
   try{
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
   }catch(e){
     print(e.toString());
     return null;
   }
 }


 // sign in with email & password

Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;
      return _userFromFirebaseUser(user);
      }catch(e){
        print(e.toString());
        return null;
    }
  }


 // register with email & password

  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;
      return _userFromFirebaseUser(user);
      }catch(e){
        print(e.toString());
        return null;
    }
  }

 // sign in with Google


 // sign out

 Future signOut() async {
   try{
     return await _auth.signOut();
   }catch(e){
     print(e.toString());
     return null;
   }
 }

}