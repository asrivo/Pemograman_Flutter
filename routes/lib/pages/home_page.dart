import 'package:flutter/material.dart';
import 'package:routes/pages/gallery_page.dart';


class HomePage extends StatelessWidget {
  static const nameRoute = '/homepage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
       ),
       body: Center(child: Text(
        "HOME PAGE",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.of(context).pushNamed(GalleryPage.nameRoute);
        
      },
      child: Icon(Icons.arrow_right_alt),
      ),
    );
  }
}