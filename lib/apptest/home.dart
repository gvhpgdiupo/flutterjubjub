import 'package:appfrong/apptest/login.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        color: Colors.green[50],
        child: Center(
          child: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        colors: [Colors.black[100], Colors.white[100]])),
                margin: EdgeInsets.all(32),
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // showLogo(),
                    showimages1(),
                    showimages2(),
                    showtext(),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Text showtext() => Text('welcome to my app',style: TextStyle(fontSize: 28,color: Colors.black),);

  Widget showimages1() {
    return Container(
        width: 130.0, height: 140.0, child: Image.asset('images/ID2.png'));
  }

  Widget showimages2() {
    return Container(
        width: 250.0, height: 250.0, child: Image.asset('images/ID1.png'));
  }
}
