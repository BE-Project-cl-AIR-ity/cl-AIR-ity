import 'package:flutter/material.dart';
import 'package:login_clairity/screens/home/home.dart';



String advice = '';
String risk = '';

class Insights extends StatefulWidget {
double aqiDisplay;
Insights(
      {this.aqiDisplay});

  @override
  _InsightsState createState() => _InsightsState();
}


class _InsightsState extends State<Insights> {

void displayAdvice() {
    if (widget.aqiDisplay <= 100) {
      advice = "Enjoy the day.";
      risk = "No risk at all.";
    } else if (widget.aqiDisplay <= 200) {
      advice =
          "Very sensitive people should consider reducing longer/heavy exertion and heavy outdoor work.";
      risk =
          "Minor health issues for sensitive people, no problem to general public.";
    } else if (widget.aqiDisplay <= 300) {
      advice =
          "People with heart or lung disease, older adults and children should reduce longer or heavy exertion and outdoor activity.";
      risk =
          "Elderly are at risk. Healthy people may start to experience slight discomfort.";
    } else if (widget.aqiDisplay <= 400) {
      advice =
          "Everyone should reduce heavy exertion. People with heart or lung disease, older adults and children should avoid longer or heavy exertion.";
      risk =
          "Triggers health alert. Everyone may experience health effects. Significant increase in respiratory problems.";
    } else if (widget.aqiDisplay <= 500) {
      advice =
          "Everyone should avoid any outdoor physical activity, people with heart or lung disease, older adults, and children do not exert at all and remain indoor.";
      risk =
          "Health warning of emergency conditions, serious risk of respiratory effects even in genral public.";
    }
    print(advice);
    print(risk);
  
  }
 
  @override
  Widget build(BuildContext context) {
                displayAdvice();

    return Scaffold(
      
      appBar: AppBar(title: Text("Insights")),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("AQI value is "+ (widget.aqiDisplay).toString(),
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(risk,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(advice,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            
          ],
        ),
      ),
    );
  }
}
