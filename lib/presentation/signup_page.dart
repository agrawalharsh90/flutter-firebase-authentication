import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _name;

  String _phone;

  String _email;

  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign UP"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please type Name';
                }
              },
              onSaved: (input) => _name = input,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 10) {
                  return 'Please type an valid phone number';
                }
              },
              onSaved: (input) => _phone = input,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
              height: 20,
            ),
            TextFormField(
              validator: (input) {
                _password=input;
                if (input.length < 6) {
                  return 'Please type an valid password';
                }
              },
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (input) {
                if (input != _password) {
                  return 'Password mismatch';
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: _signup,
              child: Text('Sign UP'),
            )
          ],
        ),
          ),
        ),
      ),
    );
  }

  _signup() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        print("auth request");
        AuthResult authResult = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        print("result");
        print(authResult.toString());
        Navigator.pop(context);
      } catch (e) {
        print("error");
        print(e.message);
      }
    }
  }
}
