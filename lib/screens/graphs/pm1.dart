import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class Pm1 extends StatefulWidget {
  @override
  _Pm1State createState() => _Pm1State();
}

class _Pm1State extends State<Pm1> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        appBar: AppBar(
          title: Text("PM 1 graph"),
        ),
       url:"https://thingspeak.com/channels/987334/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=10&type=line",
    );
  }
}