import 'package:flutter/material.dart';

class DashBordPage extends StatefulWidget {
  const DashBordPage({Key? key}) : super(key: key);

  @override
  _DashBordPageState createState() => _DashBordPageState();
}

class _DashBordPageState extends State<DashBordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Dashboard"),
      ),
      drawer: Drawer(),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 180,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 2,
                // shape: ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Punch In",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[400],
                      ),
                    ),
                    Text(
                      "Punch Out",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[400],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
