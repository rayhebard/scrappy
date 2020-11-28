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

  bool all_events;
  bool CCSE_events;
  bool fav_events;

  getSwitchValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getKeys());
    all_events = await getSwitchStateAll_Events();
    CCSE_events = await getSwitchStateCCSE_Events();
    fav_events = await getSwitchStateFavEvents();
    setState(() {});
  }

  Future<bool> saveSwitchState(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
    print('Switch Value saved $value');
    return prefs.setBool(key, value);
  }
  Future<bool> getSwitchStateFavEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool fav_events = prefs.containsKey("favorite") && prefs.getBool("favorites")? prefs.getBool("favorites"): false;
    print("Fave: " + fav_events.toString());
    return fav_events;
  }
  Future<bool> getSwitchStateCCSE_Events() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool CCSE_events = prefs.containsKey("ccse") && prefs.containsKey("ccse")? prefs.getBool("ccse"): false;
    print("CCSE: " + CCSE_events.toString());
    return CCSE_events;
  }

  Future<bool> getSwitchStateAll_Events() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool all_events =  prefs.containsKey("all") && prefs.getBool("all")? prefs.getBool("all"): false;
    print("All :"  + all_events.toString());
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
          title: Text('Notification Settings')
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
                  saveSwitchState("all", value);
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
                  saveSwitchState("ccse", value);
                  if(CCSE_events == true ){
                      firebaseMessaging.subscribeToTopic('CCSE_events');
                  }else{
                    firebaseMessaging.unsubscribeFromTopic('CCSE_events');
                  }
                });
              },
            ),
            //SwitchListTile(
              //title: const Text('Enable Push Notifications for Favorite Events:',style:kLabelTextStyle3),
             // activeColor: Colors.amber,
              //value: fav_events,
              //onChanged: (value) {
                //print("fav_events : $value");
                //setState(() {
                //  fav_events = value;
                //});
              //},
            //),
          ],
        ),
      ),
    );
  }
}




