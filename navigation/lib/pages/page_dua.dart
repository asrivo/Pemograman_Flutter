import 'package:flutter/material.dart';


class PageDua extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Dua"),
        // leading: Container(),

      ),
      body: Center(
        child: Text("INI PAGE 2",
          style: TextStyle(
          fontSize: 50,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.keyboard_arrow_left),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}