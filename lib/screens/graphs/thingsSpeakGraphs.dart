import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_clairity/screens/graphs/pm10.dart';
import 'package:login_clairity/screens/graphs/pm2_5.dart';
import 'package:login_clairity/screens/home/home.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Graphs extends StatefulWidget {

  @override
  _GraphsState createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {

  final Completer<WebViewController> _controller =  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Graphs")
      ),
      drawer: new Drawer(
        child: new ListView(children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Swaraj Bhagade"),
            accountEmail: new Text("swarajbhagade@gmail.com"),
            currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.cyan, child: new Text("S")),
          ),
          new ListTile(
              title: new Text("AQI"),
              trailing: new Icon(Icons.view_carousel),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Home()));
              }),
          new ListTile(
            title: new Text("Graphs"),
            trailing: new Icon(Icons.grain),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Graphs()));
            },
          ),
          new ListTile(
            title: new Text("Insights"),
            trailing: new Icon(Icons.insert_emoticon),
          ),
          new ListTile(
            title: new Text("FAQ"),
            trailing: new Icon(Icons.flag),
          ),
          new Divider(),
          new ListTile(
            title: new Text("Signout"),
            trailing: new Icon(Icons.account_circle),
            onTap: () async {
              //await _auth.signOut();

              //Navigator.of(context).pop();
              // Navigator.of(context).push(new MaterialPageRoute(
              //     builder: (BuildContext context) => new SignIn()));
            },
          ),
        ]),
      ),

      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),

            // PM 1 button
            RaisedButton(
              color: Colors.blue[400],
                  child: Text(
                    'PM 1',
                    style: TextStyle(color: Colors.white),
                  ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Pm2_5()));
                }
            ),

            // PM 2.5 button
            RaisedButton(
              color: Colors.blue[400],
                  child: Text(
                    'PM 2.5',
                    style: TextStyle(color: Colors.white),
                  ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Pm2_5()));
                }
            ),

            // PM 10 button
            RaisedButton(
              color: Colors.blue[400],
                  child: Text(
                    'PM 10',
                    style: TextStyle(color: Colors.white),
                  ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Pm10()));
                }
            ),

          ],
        )
      )
      
    );
  }
}