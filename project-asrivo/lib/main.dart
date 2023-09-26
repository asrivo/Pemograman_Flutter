import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 114, 192),
        body: Center(
          child: Text(
            "HALO Asrivo Maha Kurnia Pitama, Asrivo Maha Kurnia Pitama, Asrivo Maha Kurnia Pitama, Asrivo Maha Kurnia Pitama ",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              backgroundColor: Colors.amberAccent,
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 10,
              fontFamily: 'Stick',
              decorationStyle: TextDecorationStyle.wavy,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.white,
              decorationThickness: 2,
            ),
          ),
        ),
        appBar: AppBar(
          title: Text("My Apps"),
        ),
      ),
    );
  }
}


