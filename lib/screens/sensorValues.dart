import 'package:flutter/material.dart';
import 'package:login_clairity/screens/home/home.dart';

class SensorValues extends StatefulWidget {
  String pm1 = '',
      pm2_5 = '',
      pm10 = '',
      co = '',
      temp = '',
      humidity = '',
      pressure = '';
  SensorValues(
      {this.pm1,
      this.pm2_5,
      this.pm10,
      this.co,
      this.temp,
      this.humidity,
      this.pressure});

  @override
  _SensorValuesState createState() => _SensorValuesState();
}

class _SensorValuesState extends State<SensorValues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sensor Values")),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'PM 1 value : ' + pm1,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'PM 2.5 value : ' + pm2_5,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'PM 10 value : ' + pm10,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Carbon Monoxide value : ' + co,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Temperature value : ' + temp,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Humidity value : ' + humidity,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Pressure value : ' + pressure,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
