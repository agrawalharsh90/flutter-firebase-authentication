import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_email_auth/presentation/home_page.dart';

class OTP extends StatefulWidget {
  OTP({this.verificationId});

  String verificationId;

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String otp;
  FirebaseUser currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: currentUser == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('OTP Sent. Please Provide it for verification'),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextField(
                    onChanged: (value) {
                      otp = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  RaisedButton(
                    onPressed: verify,
                    child: Text(
                      'Verify',
                    ),
                  )
                ],
              )
            : Column(
                children: <Widget>[
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                      'You have signed in successfully.\n Your phone number is ' +
                          currentUser.phoneNumber)
                ],
              ),
      ),
    );
  }

  verify() async {
    try {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      if (user != null) {
        print("user is fetch");
        print(user.email);
        print(user.phoneNumber);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        print("auth request");
        AuthCredential credential = PhoneAuthProvider.getCredential(
            verificationId: widget.verificationId, smsCode: otp);
        AuthResult result =
            await FirebaseAuth.instance.signInWithCredential(credential);
        print("result");
        print(result.toString());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));

      }
    } catch (e) {
      print("error");
      print(e.message);
    }
  }

  void _enterOtp() {}
}
