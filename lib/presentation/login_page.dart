import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_email_auth/presentation/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;

  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log IN"),
      ),
      body: Center(
          child: Container(
        margin: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Please type an email';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return 'Please type an valid password';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                onPressed: _login,
                child: Text('Log IN'),
              )
            ],
          ),
        ),
      )),
    );
  }

  _login() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        print("auth request");
        AuthResult authResult = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        print("result");
        print(authResult.toString());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        print("error");
        print(e.message);
      }
    }
  }
}
