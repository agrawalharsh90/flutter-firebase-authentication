import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_email_auth/presentation/otp.dart';

class Phone extends StatefulWidget {
  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  String phone;
  String verifId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                phone = value;
              },
              decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            RaisedButton(
              onPressed: phoneAuth,
              child: Text(
                'Log IN',
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> phoneAuth() {
    print(phone);
    try {
      FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (String id, [int forceCodeSend]) {
          verifId = id;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTP(
                verificationId: verifId,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String id) {
          verifId = id;
        },
        timeout: Duration(seconds: 10),
        verificationCompleted: (AuthCredential credential) {
          print(credential);
        },
        verificationFailed: (AuthException exception) {
          print(exception.message);
        },
      );
    } catch (e) {
      print(e.message);
    }
  }
}
