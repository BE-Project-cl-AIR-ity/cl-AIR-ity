import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrentLocation extends StatefulWidget {
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  String _latitude = '';
  String _longitude = '';
  String reverseLocation = '';
  String updatedLink = '';
  String userLocation = '';
  Map data;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Current Location')),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(userLocation),
            FlatButton(
              onPressed: () {
                _getCurrentLocation();
              },
              color: Colors.brown[100],
              child: Text('Press to get current location'),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
                color: Colors.blue[200],
                child: Text(
                  'Go Back',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
