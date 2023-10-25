import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool statusSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Center(child: Column(
          children: [
              Switch(
                value: statusSwitch,
                onChanged: (value) {
                  setState(() {
                    statusSwitch = !statusSwitch;
                  });
                  print(statusSwitch);
                },
              ),
              
              Text(
                // if(statusSwitch == true)"Swicth On" else "Switch Off",
                (statusSwitch == true) ? "Swicth On" : "Switch Off",
                style: TextStyle(
                  fontSize: 35,
              ),
            ) 
          ],
        ),
      ),
    );
  }
}
