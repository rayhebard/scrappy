import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/calendar_page.dart';
import 'screens/events_bank_page.dart';
import 'screens/event_details_page.dart';
import 'screens/event_tags_page.dart';
import 'screens/favorites_page.dart';
import 'screens/map_page.dart';
import 'screens/notification_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



void main() => runApp(Scrappy());

class Scrappy extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarColor: Colors.white,
        accentColor: Colors.amberAccent
      ),
      home: EventsBankPage(),
      routes: {
        EventsBankPage.id:(context)=>EventsBankPage(),
        EventDetailsPage.id : (context)=>EventDetailsPage(),
        EventsBankPage.id:(context)=>EventTagsPage(),
        FavoritesPage.id:(context)=>FavoritesPage(),
        MapPage.id:(context)=>MapPage(),
        NotificationPage.id:(context)=>NotificationPage(),
      },
    );
  }
}








