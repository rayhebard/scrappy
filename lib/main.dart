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
      home: BottomNav(),
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

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex=0;
    final List<Widget> _children=<Widget>[
      EventsBankPage(),
      FavoritesPage(),
      CalendarPage(),
      NotificationPage(),
      MapPage(),
    ];

    void onTappedBar(int index)
    {setState(() {
      _currentIndex=index;
    });}
    return new Scaffold(
      body: _children.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(

        onTap: onTappedBar,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(

              icon: new Icon(FontAwesomeIcons.home),
              title: new Text("Home")),
          BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.star),
              title: new Text("Favorites")),
          BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.calendar),
              title: new Text("Calendar")),
          BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.bell),
              title: new Text("Notifications")),
          BottomNavigationBarItem(
              icon: new Icon(FontAwesomeIcons.compass),
              title:  new Text("Campus Maps")),
        ],
      ),

    );
  }
}




