import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Column"), 
        ),
        body: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 400,
              height: 400,
              color: Colors.green,
            ),
            Container(
              width: 300,
              height: 300,
              color: Colors.blue,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.amber,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ]
        ),
      ),
    );
  }
}

