import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terickmitra/Api/api_service.dart';
import 'package:terickmitra/Screens/dashbord.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passlController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  bool _obscureText = true;
  // Toggles the password show status
  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // void showHidePassword() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _loginFormKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 80,
                ),
                Image.asset(
                  "assets/image/logo_terick.png",
                  fit: BoxFit.contain,
                  width: 80,
                  height: 90,
                ),
                SizedBox(
                  height: 90,
                ),
                Container(
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(top: 1),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontFamily: 'MyriadPro',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green[400]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    controller: emailController,
                    // validator: validateEmail(TexEd),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Enter Username',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Username';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: TextFormField(
                    controller: passlController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordStatus,
                        color: Colors.green[400],
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Correct password';
                      }

                      return null;
                    },
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            fontFamily: 'MyriadPro',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  onTap: () {
                    final isValid = _loginFormKey.currentState!.validate();
                    if (!isValid) {
                      return;
                    }

                    LoginUser();
                  },
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                    // alignment: Alignment.centerRight,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  onTap: () {
                    // Navigator.of(cntext).pushReplacement(
                    //     MaterialPageRoute(
                    //         builder: (context) => ForgotPassword()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LoginUser() async {
    http.Response response =
        await http.post(Uri.parse(RestApi.loginApi), body: {
      'username': emailController.text.toString(),
      'password': passlController.text.toString()
    });
    var result = json.decode(response.body);
    print(result);
    if (result['status'] == "ok") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DashBordPage()));
      final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      sharedPreferences.setString("email", emailController.text);
    }
  }
}
