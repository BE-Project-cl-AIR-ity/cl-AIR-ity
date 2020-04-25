import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_clairity/screens/graphs/pm10.dart';
import 'package:login_clairity/screens/graphs/pm2_5.dart';
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