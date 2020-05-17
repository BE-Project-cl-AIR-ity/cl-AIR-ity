import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_clairity/screens/authenticate/auth.dart';
import 'package:login_clairity/screens/graphs/thingsSpeakGraphs.dart';
import 'package:login_clairity/screens/insights.dart';
import 'package:login_clairity/screens/sensorValues.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  final UserDetails detailsUser;

  Home({Key key, @required this.detailsUser}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

String pm1 = '', pm2_5 = '', pm10 = '', co = '', temp='', humidity = '', pressure = '';
double aqiDisplay = 0;
String _latitude = '';
String _longitude = '';
String reverseLocation = '';
String updatedLink = '';
String userLocation = '';
Map data;
String advice ;
  String risk ;

class _HomeState extends State<Home> {
  final GoogleSignIn _gSignIn = GoogleSignIn();

  Map data;
  Future getData() async {
    http.Response response = await http.get(
        "https://api.thingspeak.com/channels/987334/feeds/last.json?api_key=88BMJAAFH25HIF9X&results=100");
    data = json.decode(response.body);
    setState(() {
      pm1 = data["field1"];

      pm2_5 = data["field2"];

      pm10 = data["field3"];

      co = data["field4"];

      temp=data["field5"];

      humidity = data["field6"];

      pressure = data["field7"];

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
    //aqiDisplay = 200;
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
    double width = MediaQuery.of(context).size.width;
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
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Colors.deepOrangeAccent[50],
        //AppBAr
        appBar: AppBar(
          title: Text('Air Pollution values'),
          //backgroundColor: Color(0xffFF8427),
          elevation:
              defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.signOutAlt,
                size: 20.0,
                color: Colors.white,
              ),
              onPressed: () {
                _gSignIn.signOut();
                print('Signed out');
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Auth()));
              },
            ),
          ],
        ),

        drawer: new Drawer(
          child: new ListView(children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(widget.detailsUser.userName),
              accountEmail: new Text(widget.detailsUser.userEmail),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: NetworkImage(widget.detailsUser.photoUrl),
                radius: 10.0,
              ),
            ),
            new ListTile(
                title: new Text("AQI"),
                trailing: new Icon(FontAwesomeIcons.smog),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Home()));
                }),
            new ListTile(
              title: new Text("Graphs"),
              trailing: new Icon(FontAwesomeIcons.chartLine),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Graphs()));
              },
            ),
            new ListTile(
              title: new Text("Sensor Values"),
              trailing: new Icon(FontAwesomeIcons.bolt),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new SensorValues(pm1: pm1, pm2_5: pm2_5, pm10: pm10, co: co, temp: temp, humidity: humidity, pressure: pressure)));
              },
            ),
            new ListTile(
              title: new Text("Insights"),
              trailing: new Icon(FontAwesomeIcons.dizzy),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Insights(aqiDisplay: aqiDisplay)));
              },
            ),
            new ListTile(
              title: new Text("FAQ"),
              trailing: new Icon(FontAwesomeIcons.question),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Signout"),
              trailing: new Icon(FontAwesomeIcons.signOutAlt),
              onTap: () async {
                _gSignIn.signOut();
                print('Signed out');
                Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Auth()));
              },
            ),
          ]),
        ),

        body: Container(
          //color: Color(0xffFF8427),
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(children: <Widget>[
            SizedBox(height: 30),
            Text(
              userLocation,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
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
                       
          ]),
        ),
      ),
    );
  }
}
