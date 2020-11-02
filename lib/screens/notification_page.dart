import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/constants.dart';
import 'package:scrappy/components/Nav_Bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationPage extends StatefulWidget {
  static const String id = '/notification_page';
  NotificationPage() : super();
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  List<Message> _messages;

  _getToken(){
    _firebaseMessaging.getToken().then((deviceToken){
      print("Device Token: $deviceToken");
    });
  }

  _configureFirebaseListeners(){
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic>message) async{
        print('onMessage: $message');
        _setMessage(message);
      },
      onLaunch: (Map<String, dynamic>message) async{
        print('onLaunch: $message');
        _setMessage(message);
      },
      onResume: (Map<String, dynamic>message) async{
        print('onResume: $message');
        _setMessage(message);
      },
    );
  }

  _setMessage(Map<String, dynamic>message){
    final notification = message['notification'];
    final data = message['data'];
    final String title = notification['title'];
    final String body = notification['body'];
    final String mMessage = data['message'];
    setState(() {
      Message m = Message(title, body, mMessage);
      _messages.add(m);
    });

  }

  @override
  void initState(){
    super.initState();
    _messages = List<Message>();
    _getToken();
    _configureFirebaseListeners();
  }

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
class Message{
  String title;
  String body;
  String message;
  Message(title, body, message){
    this.title = title;
    this.body = body;
    this.message = message;

  }
}


