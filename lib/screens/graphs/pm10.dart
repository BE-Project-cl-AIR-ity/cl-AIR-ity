import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class Pm10 extends StatefulWidget {
  @override
  _Pm10State createState() => _Pm10State();
}

class _Pm10State extends State<Pm10> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        appBar: AppBar(
          title: Text("PM 10 graph"),
        ),
       url:"https://thingspeak.com/channels/987334/charts/3?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=10&type=line",
    );
  }
}