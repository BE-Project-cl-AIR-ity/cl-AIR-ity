import 'package:flutter/material.dart';
import 'package:login_clairity/appDrawer.dart';
import 'package:login_clairity/models/user.dart';
import 'package:login_clairity/screens/graphs/thingsSpeakGraphs.dart';
import 'package:login_clairity/screens/home/home.dart';
import 'package:login_clairity/screens/wrapper.dart';
import 'package:login_clairity/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main() {
  // Register your license here
        SyncfusionLicense.registerLicense('NT8mJyc2IWhia31ifWN9Z2FoZnxhZXxhY2Fjc2RpYGJpYmtzEh5oISYnJjkyfTc2IDsjMj03Nj46JxM0PjI6P30wPD4=');
  return runApp(MyApp());
}

Map<int, Color> color =
{
50:Color.fromRGBO(136,14,79, .1),
100:Color.fromRGBO(136,14,79, .2),
200:Color.fromRGBO(136,14,79, .3),
300:Color.fromRGBO(136,14,79, .4),
400:Color.fromRGBO(136,14,79, .5),
500:Color.fromRGBO(136,14,79, .6),
600:Color.fromRGBO(136,14,79, .7),
700:Color.fromRGBO(136,14,79, .8),
800:Color.fromRGBO(136,14,79, .9),
900:Color.fromRGBO(136,14,79, 1),
};
MaterialColor colorCustom = MaterialColor(0xffFF8427, color);


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(primarySwatch: colorCustom),
      
      ),
    ); 
  }
}
