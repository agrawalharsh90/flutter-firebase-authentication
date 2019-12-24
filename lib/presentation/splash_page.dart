import 'package:flutter/material.dart';
import 'package:flutter_firebase_email_auth/presentation/login_page.dart';
import 'package:flutter_firebase_email_auth/presentation/phone.dart';
import 'package:flutter_firebase_email_auth/presentation/signup_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Log IN"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              child: Text("Sign UP"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              child: Text("Sign IN Using Phone Number"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Phone()));
              },
            )
          ],
        ),
      ),
    );
  }
}
