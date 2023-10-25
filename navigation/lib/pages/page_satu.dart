import 'package:flutter/material.dart';
import './page_dua.dart';

class PageSatu extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Satu"),
      ),
      body: Center(
        child: Text("INI PAGE 1",
          style: TextStyle(
          fontSize: 50,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return PageDua();
              },
            ),
          );
        },
        child: Icon(Icons.keyboard_arrow_right),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}