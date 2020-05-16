import 'package:flutter/material.dart';
//mport 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_clairity/screens/authenticate/auth.dart';



class ProfileScreen extends StatefulWidget {
  final UserDetails detailsUser;

  ProfileScreen({Key key, @required this.detailsUser}) : super(key: key);  

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
  final GoogleSignIn _gSignIn =  GoogleSignIn();

    return  Scaffold(
        appBar:  AppBar(
          title:  Text(widget.detailsUser.userName),
          automaticallyImplyLeading: false,
          actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.signOutAlt,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: (){
               _gSignIn.signOut();
              print('Signed out');
               Navigator.pop(context);
             
            },
          ),
        ],
        ),
        body:Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage:NetworkImage(widget.detailsUser.photoUrl),
                radius: 50.0,
              ),
              SizedBox(height:10.0),
               Text(
                "Name : " + widget.detailsUser.userName,
                style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20.0),
              ),
              SizedBox(height:10.0),
               Text(
                "Email : " + widget.detailsUser.userEmail,
                style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20.0),
              ),
              SizedBox(height:10.0),
              Text(
                "Provider : " + widget.detailsUser.providerDetails,
                style:  TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20.0),
              ),
            ],
          ),)
        );
  }
}