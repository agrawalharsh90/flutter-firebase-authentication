import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
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
