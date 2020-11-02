import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class pushNotifications extends StatefulWidget{
  pushNotifications() : super ();

  final String title = 'pushNotifications';
  @override
  State<StatefulWidget> createState() => pushNotifcations();
}

class pushNotifcations extends State<pushNotifications>{
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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