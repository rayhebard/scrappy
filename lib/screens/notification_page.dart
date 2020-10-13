import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/constants.dart';
import 'package:scrappy/Nav_Bar.dart';
class NotificationPage extends StatefulWidget {
  static const String id = '/notification_page';
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(),
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


