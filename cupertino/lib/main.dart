import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (Platform.isAndroid) {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1999),
                lastDate: DateTime(2050),
              );
            } else {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    color: Colors.white,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (datetime) {
                        print(datetime);
                      },
                      initialDateTime: DateTime.now(),
                    ),
                  );
                },
              );
            }
          },
          child: Text("Date Picker"),
        ),
      ),
    );
  }
}

