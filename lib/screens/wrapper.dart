import 'package:flutter/material.dart';
import 'package:login_clairity/models/user.dart';
import 'package:login_clairity/screens/animations/splash.dart';
import 'package:login_clairity/screens/authenticate/authenticate.dart';
import 'package:login_clairity/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';


class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

result(user) {
  if (user == null) {
    return Authenticate();
  } else {
    return Home();
  }
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final double width = MediaQuery.of(context).size.width;
    //return either home or authenticate widget

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
