import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/constants.dart';
import 'package:scrappy/components/Nav_Bar.dart';

class NotificationPage extends StatefulWidget {
  static const String id = '/notification_page';
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool status  = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(),
      appBar:AppBar(
          title: Text('Scrappy')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SwitchListTile(
              title: const Text('Push Notifications:',style:kLabelTextStyle3),
              activeColor: Colors.amber,
              value: status,
              onChanged: (value) {
                print("VALUE : $value");
                setState(() {
                  status = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Email Notifications:',style:kLabelTextStyle3),
              activeColor: Colors.amber,
              value: status,
              onChanged: (value) {
                print("VALUE : $value");
                setState(() {
                  status = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Favorite Events Notifications:',style:kLabelTextStyle3),
              activeColor: Colors.amber,
              value: status,
              onChanged: (value) {
                print("VALUE : $value");
                setState(() {
                  status = value;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}


