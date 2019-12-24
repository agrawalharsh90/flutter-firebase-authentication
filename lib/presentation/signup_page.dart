import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Text(
          "Welcome",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
