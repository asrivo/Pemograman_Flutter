import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar (
          title: Text("Date Format"),
          ),
          body: Center(
            child: Text(
            // DateFormat.d().format(DateTime.now()),
            //DateFormat.EEEE().format(DateTime.now()),
            //DateTime.now().toString(),
            DateFormat.yMMMMEEEEd().add_Hms().format(DateTime.now()),
            style: TextStyle(
            fontSize: 25,
            ),
          ),
        ),
      ) ,
    );
  }
}

