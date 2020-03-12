import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final arg = ModalRoute.of(context).settings.arguments;

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
            padding: const EdgeInsets.only(right: 20, left: 20, top: 170),
            child: SelectableText(arg, style: TextStyle(
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