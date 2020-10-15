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
import 'screens/loading_screen.dart';



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
      home: LoadingScreen(),
      routes: {
        EventsBankPage.id:(context)=>EventsBankPage(),
        EventDetailsPage.id : (context)=>EventDetailsPage(),
        FavoritesPage.id:(context)=>FavoritesPage(),
        EventTagsPage.id:(context)=>EventTagsPage(),
        MapPage.id:(context)=>MapPage(),
        NotificationPage.id:(context)=>NotificationPage(),
        LoadingScreen.id:(context)=>LoadingScreen()
      },
    );
  }
}








