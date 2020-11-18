import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/constants.dart';
import 'package:scrappy/components/Nav_Bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationPage extends StatefulWidget {
  static const String id = '/notification_page';
  NotificationPage() : super();
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  bool all_events = false;
  bool CCSE_events = false;
  bool fav_events = false;

  bool status  = false;

  getSwitchValues() async {
    all_events = await getSwitchStateAll_Events();
    CCSE_events = await getSwitchStateCCSE_Events();
    fav_events = await getSwitchStateFavEvents();
    setState(() {});
  }

  Future<bool> saveSwitchState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("switchState", value);
    print('Switch Value saved $value');
    return prefs.setBool("switchState", value);
  }
  Future<bool> getSwitchStateFavEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool fav_events = prefs.getBool("switchState");
    print(fav_events);
    return fav_events;
  }
  Future<bool> getSwitchStateCCSE_Events() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool CCSE_events = prefs.getBool("switchState");
    print(CCSE_events);
    return CCSE_events;
  }

  Future<bool> getSwitchStateAll_Events() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool all_events = prefs.getBool("switchState");
    print(all_events);
    return all_events;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSwitchValues();
  }

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
              title: const Text('Enable Push Notifications for all Events:',style:kLabelTextStyle3),
              activeColor: Colors.amber,
              value:all_events ,
              onChanged: (value) {
                print("all_events : $value");
                setState(() {
                  saveSwitchState(value);
                  all_events = value;
                  if(value == true ){
                      firebaseMessaging.subscribeToTopic('all_events');
                  }else{
                    firebaseMessaging.unsubscribeFromTopic('all_events');
                  }
                });
              },
            ),
            SwitchListTile(
              title: const Text('Enable Push Notifications for CCSE Events:',style:kLabelTextStyle3),
              activeColor: Colors.amber,
              value: CCSE_events,
              onChanged: (value) {
                print("CCSE_events : $value");
                setState(() {
                  CCSE_events = value;
                  saveSwitchState(value);
                  if(CCSE_events == false ){
                      firebaseMessaging.subscribeToTopic('CCSE_events');
                  }else{
                    firebaseMessaging.unsubscribeFromTopic('CCSE_events');
                  }
                });
              },
            ),
            SwitchListTile(
              title: const Text('Enable Push Notifications for Favorite Events:',style:kLabelTextStyle3),
              activeColor: Colors.amber,
              value: fav_events,
              onChanged: (value) {
                print("fav_events : $value");
                setState(() {
                  fav_events = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}




