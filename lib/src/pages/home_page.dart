import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _homeScreenText = "Waiting for token...";

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
        _homeScreenText = "$token";
      });
      print(_homeScreenText);
    });
  }

      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(245, 87, 78, 0.9),
          title: Column(
            children: <Widget>[
              SizedBox(height: 5),
              Center(
                child: Text('Push Notifications - Prototype', style: TextStyle(
                  fontSize: 16.0
                ),),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 140, bottom: 5),
            child: Text('Your token is', style: TextStyle(
              fontSize: 16.5,
              color: Color.fromRGBO(26, 49, 99, 1.0),
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: SelectableText(_homeScreenText, style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(26, 49, 99, 1.0)
            )),
          ),
          Expanded(child: Container()),
          Container(
            height: 8,
            color: Color.fromRGBO(250, 185, 91, 1.0),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('from', style: TextStyle(fontSize: 13.0, color: Colors.grey[300]),),
                Text('Dinbog', style: TextStyle(fontSize: 15.0, color: Colors.grey[300]),)
              ],
            ),
            height: 50,
            width: double.infinity,
            color: Color.fromRGBO(26, 49, 99, 1.0),
          )
        ],
      ),
    );
  }
}