import 'package:drawer/pages/page_satu.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        //leading: Icon(Icons.menu),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              color: Colors.red,
              alignment: Alignment.bottomLeft,
              child: Text(
                "Some Text Here!", 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => PageSatu()
                  ),
                  );
              },
              leading: Icon(
                Icons.home,
                size: 35,
                ),
              title: Text(
                "Home",
                  style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
               onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SettingPage(),
                  ),
                  );
              },
              leading: Icon(
                Icons.settings,
                size: 35,
                ),
              title: Text(
                "Settings",
                  style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ],
        
      ),
      ),
      body: Center(
        child: Text(
          "Some Text Here!", 
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
    );
  }
  
}