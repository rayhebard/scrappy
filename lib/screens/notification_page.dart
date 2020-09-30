import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/constants.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: Text('Scrappy')
      ),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Text('Notifications', style: kTItleTextStyle,)
            ],
          )
      ),
    );
  }
}


