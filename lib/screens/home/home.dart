import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login_clairity/screens/graphs/thingsSpeakGraphs.dart';
import 'package:login_clairity/screens/home/radialMeter.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:login_clairity/screens/map/location.dart';
import 'package:login_clairity/services/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String pm1, pm2_5, pm10, name1;
double aqiDisplay, number = 55;

calculateAqi() {
  var aqi = double.parse(pm2_5);
  if ((aqi >= 0) & (aqi < 12)) {
    aqiDisplay = (aqi - 0) * (50) / (12);
  } else if ((aqi >= 12) & (aqi < 35.5)) {
    aqiDisplay = (aqi - 12) * (50) / (23.5) + 50;
  } else if ((aqi >= 35.5) & (aqi < 55.5)) {
    aqiDisplay = (aqi - 35.5) * (50) / (20) + 70;
  } else if ((aqi >= 55.5) & (aqi < 150.5)) {
    aqiDisplay = (aqi - 55.5) * (50) / (95) + 150;
  } else if ((aqi >= 150.5) & (aqi < 250.5)) {
    aqiDisplay = (aqi - 150.5) * (70) / (70) + 200;
  } else if ((aqi >= 250.5) & (aqi < 350.5)) {
    aqiDisplay = (aqi - 250.5) * (70) / (70) + 300;
  } else if ((aqi >= 350.5) & (aqi < 500.5)) {
    aqiDisplay = (aqi - 350.5) * (70) / (150) + 400;
  }
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  Map data;
  Future getData() async {
    http.Response response = await http.get(
        "https://api.thingspeak.com/channels/987334/feeds/last.json?api_key=88BMJAAFH25HIF9X&results=100");
    data = json.decode(response.body);
    setState(() {
      pm1 = data["field1"];

      pm2_5 = data["field2"];

      pm10 = data["field3"];

      name1 = data["field4"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    calculateAqi();
    var radialAxis = RadialAxis(
      minimum: 0,
      maximum: 500,
      interval: 50,
      pointers: <NeedlePointer>[
        NeedlePointer(value: aqiDisplay, enableAnimation: true)
      ],
      ranges: <GaugeRange>[
        GaugeRange(startValue: 0, endValue: 100, color: Colors.green),
        GaugeRange(startValue: 100, endValue: 200, color: Colors.yellow),
        GaugeRange(startValue: 200, endValue: 300, color: Colors.orange),
        GaugeRange(startValue: 300, endValue: 500, color: Colors.red)
      ],
    );
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Air Pollution values'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(children: <Widget>[
          SizedBox(height: 30),
          Text('AQI Value'),
          SizedBox(height: 20),
          SfRadialGauge(axes: <RadialAxis>[radialAxis]),
          Row(
            children: <Widget>[
              Text('PM 1 value : ' + pm1),
              SizedBox(width: 30),
              Text('PM 2.5 value : ' + pm2_5),
              SizedBox(width: 30),
              Text('PM 10 value : ' + pm10),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              // location button
              SizedBox(width: 80.0),
              RaisedButton(
                  color: Colors.blue[400],
                  child: Text(
                    'Location',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CurrentLocation()));
                  }),

              // graphs button
              SizedBox(width: 30.0),
              RaisedButton(
                  color: Colors.blue[400],
                  child: Text(
                    'Graphs',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Graphs()));
                  }),
            ],
          ),
        ]),
      ),
    );
  }
}
