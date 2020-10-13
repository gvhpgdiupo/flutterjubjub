import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email, password, cpassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('My Fong App', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              MaterialPageRoute route =
                  MaterialPageRoute(builder: (value) => LoginPage());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white[50],
        child: Center(
          child: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        colors: [Colors.blue[100], Colors.black[100]])),
                margin: EdgeInsets.all(32),
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    showtext(),
                    mySizebox(),
                    buildTextFieldEmail(),
                    buildTextFieldPassword(),
                    buildTextFieldconPassword(),
                    buildButtonSignUp(),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Text showtext() => Text(
        'Register',
        style: TextStyle(fontSize: 28, color: Colors.green),
      );

  Container buildTextFieldEmail() {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.green[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            onChanged: (value) => email = value.trim(),
            decoration: InputDecoration.collapsed(hintText: "Email"),
            style: TextStyle(fontSize: 18)));
  }

  Container buildTextFieldPassword() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.red[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            onChanged: (value) => password = value.trim(),
            obscureText: true,
            decoration: InputDecoration.collapsed(hintText: "Password"),
            style: TextStyle(fontSize: 18)));
  }

  Container buildTextFieldconPassword() {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.blue[50], borderRadius: BorderRadius.circular(16)),
        child: TextField(
            onChanged: (value) => cpassword = value.trim(),
            obscureText: true,
            decoration: InputDecoration.collapsed(hintText: "Confirm Password"),
            style: TextStyle(fontSize: 18)));
  }

  mySizebox() => SizedBox(
        width: 8.0,
        height: 20.0,
      );

  Widget buildButtonSignUp() => Center(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(top: 16.0),
          width: 400,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: FlatButton(
              color: Colors.black[200],
              onPressed: () {
                if (email == null ||
                    email.isEmpty ||
                    password == null ||
                    password.isEmpty ||
                    cpassword == null ||
                    cpassword.isEmpty) {
                  normalDialog(context, 'กรุณากรอกข้อมูลให้ครบ');
                } else if (password != cpassword || cpassword != password) {
                  normalDialog(context, 'รหัสไม่ตรงกัน กรุณากรอกใหม่');
                } else if (password.length < 6) {
                  normalDialog(context, 'รหัสต้องมีมากกว่า 6 หลัก');
                } else {
                  checksignUp();
                }
              },
              child: Text(
                'Sign In',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
        ),
      );
      Future<void> checksignUp() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      print("Sign up user successful.");
      MaterialPageRoute materialPageRoute =                              
          MaterialPageRoute(builder: (BuildContext context) => LoginPage());  
      Navigator.of(context).pushAndRemoveUntil(                           
          materialPageRoute, (Route<dynamic> route) => false);            
    }).catchError((error) {
      normalDialog(context, 'กรุณากรอกข้อมูลใหม่');
    });
  }
}

