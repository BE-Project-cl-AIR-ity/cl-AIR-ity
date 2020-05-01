import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialMeter extends StatefulWidget {
  
  @override
  _RadialMeterState createState() => _RadialMeterState();
}

void calculateAQi ()
{

}

class _RadialMeterState extends State<RadialMeter> {

  double number = 36;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Center(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 500,
                  interval: 50,
                  pointers: <NeedlePointer>[
                    NeedlePointer(
                      value: number,
                      enableAnimation: true
                    )
                  ],
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: 100,
                      color: Colors.green
                      ),
                      GaugeRange(
                      startValue: 100,
                      endValue: 200,
                      color: Colors.yellow
                      ),
                      GaugeRange(
                      startValue: 200,
                      endValue: 300,
                      color: Colors.orange
                      ),
                      GaugeRange(
                      startValue: 300,
                      endValue: 500,
                      color: Colors.red
                      )
                  ],
                  
                )
              ]
            )
          ],
        ),
      ), 
    );
  }
}
