import 'package:flutter/material.dart';
import 'package:login_clairity/models/user.dart';
import 'package:login_clairity/screens/wrapper.dart';
import 'package:login_clairity/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main() {
  // Register your license here
        SyncfusionLicense.registerLicense('NT8mJyc2IWhia31ifWN9Z2FoZnxhZXxhY2Fjc2RpYGJpYmtzEh5oISYnJjkyfTc2IDsjMj03Nj46JxM0PjI6P30wPD4=');
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    ); 
  }
}
