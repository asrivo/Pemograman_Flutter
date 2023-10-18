import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fitur TextField"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              showCursor: true,
              cursorColor: Colors.amber,
              // cursorWidth: 10,
              // cursorHeight: 25,
              // cursorRadius: Radius.circular(20),
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              textCapitalization: TextCapitalization.none,

              style:  TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
              obscureText: true,

              decoration: InputDecoration(
                fillColor: Colors.amber,
                filled: true,
                icon: Icon(
                  Icons.person,
                  size: 35,
                ),
                border: OutlineInputBorder(),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                ),
                
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    ),
                ),

                prefixIcon: Icon(Icons.add_a_photo),
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                   onPressed: () {},
                   ),
                // prefixIcon: Icon(
                //   Icons.person_add,
                //   size: 35,
                //   ),
                // prefixText: "Name: ",
                // prefix: Icon(
                //   Icons.person_add,
                //   size: 35,
                // ), 
                hintText: "Please input your name..",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                labelText: "Full Name",
                labelStyle: TextStyle(
                  color: Colors.black,
                )
              ),
            ),
          ),
        ),
      ),
      
    );
  }
}
