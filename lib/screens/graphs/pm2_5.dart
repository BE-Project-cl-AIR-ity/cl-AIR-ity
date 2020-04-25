import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class Pm2_5 extends StatefulWidget {
  @override
  _Pm2_5State createState() => _Pm2_5State();
}

class _Pm2_5State extends State<Pm2_5> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        appBar: AppBar(
          title: Text("PM 2.5 graph"),
        ),
       url:"https://thingspeak.com/channels/987334/charts/2?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=10&type=line",
    );
  }
}