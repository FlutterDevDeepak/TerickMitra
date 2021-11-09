import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terickmitra/Screens/dashbord.dart';
import 'package:terickmitra/Screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? finalEmail;

  void initState() {
    super.initState();
    getvalidationData().whenComplete(() async {
      Timer(
          Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>
                  finalEmail == null ? LoginPage() : DashBordPage())));
    });
  }

  Future getvalidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainEmail = sharedPreferences.getString("email");
    setState(() {
      finalEmail = obtainEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                "Terick Motocorp",
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              SizedBox(height: 100),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  // "assets/image/logo_terick.png",
                  "assets/image/saarthi.jpg",
                  fit: BoxFit.cover,
                  height: size.height / 4,
                  width: size.width / 2,
                ),
              ),
              SizedBox(
                height: size.height / 4,
              ),
              Text(
                "Powered By:-",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                "Technicus Infotech LLP.",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
