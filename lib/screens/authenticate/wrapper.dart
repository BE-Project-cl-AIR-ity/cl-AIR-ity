import 'package:flutter/material.dart';
import 'package:login_clairity/screens/authenticate/auth.dart';
import 'package:login_clairity/screens/home/home.dart';
import 'package:splashscreen/splashscreen.dart';

String user='';

class Wrapper extends StatefulWidget {
  final UserDetails detailsUser;

  Wrapper({Key key, @required this.detailsUser}) : super(key: key);  

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
result(user) {
  if (user == null) {
    return Auth();
  } else {
    return Home(detailsUser: widget.detailsUser);
  }
}

  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widget

  user = widget.detailsUser.userEmail;
  print(user);

    return SplashScreen(
    
      seconds: 2,
      navigateAfterSeconds: result(user),
      image: new Image.asset('assets/final_logo.png'),
      backgroundColor: Colors.white,
      photoSize: 150.0,
      loadingText: Text('Welcome to Clarity',
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
    );
  }
}




