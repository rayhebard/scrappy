import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/calendar_page.dart';
import 'screens/events_bank_page.dart';
import 'screens/event_details_page.dart';
import 'screens/event_tags_page.dart';
import 'screens/favorites_page.dart';
import 'screens/map_page.dart';
import 'screens/notification_page.dart';




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
        '/event_bank':(context)=>EventsBankPage(),
        '/event_details': (context)=>EventDetailsPage(),
        '/event_tags':(context)=>EventTagsPage(),
        '/favorites':(context)=>FavoritesPage(),
        '/maps':(context)=>MapPage(),
        '/notification_page':(context)=>NotificationPage(),
      },
    );
  }
}


