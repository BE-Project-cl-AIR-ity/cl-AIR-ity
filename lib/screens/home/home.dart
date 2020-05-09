import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login_clairity/screens/graphs/thingsSpeakGraphs.dart';
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

String pm1 = '', pm2_5 = '', pm10 = '', name1 = '';
double aqiDisplay = 0;
String _latitude = '';
String _longitude = '';
String reverseLocation = '';
String updatedLink = '';
String userLocation = '';
Map data;

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
    });

    //aqiDisplay = double.parse(pm2_5);

    double aqi = double.parse(pm2_5);
    print(aqi);
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
    aqiDisplay = aqiDisplay.roundToDouble();
    print(aqiDisplay);
  }

  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _latitude = "${position.latitude}";
      _longitude = "${position.longitude}";
    });
    reverseLocation =
        'https://us1.locationiq.com/v1/reverse.php?key=103f2afd36ee01&lat=' +
            _latitude +
            '&lon=' +
            _longitude +
            '&format=json';
    updatedLink = reverseLocation;
    print(updatedLink);
    http.Response response = await http.get(updatedLink);
    data = json.decode(response.body);
    setState(() {
      userLocation = data["display_name"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    // Radial Meter
    var radialAxis = RadialAxis(
      minimum: 0,
      maximum: 500,
      interval: 50,
      pointers: <GaugePointer>[
        NeedlePointer(value: aqiDisplay, enableAnimation: true)
      ],
      annotations: <GaugeAnnotation>[
        GaugeAnnotation(
            widget: Container(
                child: Text(aqiDisplay.toString(),
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
            angle: 90,
            positionFactor: 0.5)
      ],
      ranges: <GaugeRange>[
        GaugeRange(
            startValue: 0, endValue: 100, color: Colors.greenAccent[100]),
        GaugeRange(
            startValue: 100, endValue: 200, color: Colors.yellowAccent[100]),
        GaugeRange(
            startValue: 200, endValue: 300, color: Colors.orangeAccent[100]),
        GaugeRange(startValue: 300, endValue: 500, color: Colors.redAccent[100])
      ],
    );
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent[50],
      appBar: AppBar(
        title: Text('Air Pollution values'),
        backgroundColor: Color(0xffFF8427),
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
        //color: Color(0xffFF8427),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(children: <Widget>[
          SizedBox(height: 30),
          Text(userLocation,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
          //Text('AQI Value'),
          SizedBox(height: 20),
          //Radial Meter
          SfRadialGauge(
              title: GaugeTitle(
                  text: 'AQI Value',
                  textStyle:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              axes: <RadialAxis>[radialAxis]),
          // PM values Display
          Row(
            children: <Widget>[
              Text('PM 1 value : ' + pm1,
               style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
              SizedBox(width: 30),
              Text('PM 2.5 value : ' + pm2_5,
               style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
              SizedBox(width: 30),
              Text('PM 10 value : ' + pm10,
               style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
            ],
          ),

          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              // location button
              // SizedBox(width: 80.0),
              // RaisedButton(
              //     color: Colors.blue[400],
              //     child: Text(
              //       'Location',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (BuildContext context) =>
              //                   CurrentLocation()));
              //     }),

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
