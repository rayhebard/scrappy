import 'package:flutter/material.dart';
import 'package:scrappy/screens/favorites_page.dart';
import 'screens/event_tags_page.dart';
import 'screens/calendar_page.dart';
import 'screens/notification_page.dart';
import 'screens/map_page.dart';
import 'screens/events_bank_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          FlatButton(
              onPressed: () => Navigator.pushNamed(context, EventsBankPage.id),
              child: Icon(FontAwesomeIcons.home, color: Colors.white)),
          FlatButton(
              onPressed: () => Navigator.pushNamed(context, FavoritesPage.id),
              child: Icon(FontAwesomeIcons.star, color: Colors.white)),
          FlatButton(
              onPressed: () => Navigator.pushNamed(context, CalendarPage.id),
              child: Icon(FontAwesomeIcons.calendar, color: Colors.white)),
          FlatButton(
              onPressed: () => Navigator.pushNamed(context, NotificationPage.id),
              child: Icon(FontAwesomeIcons.bell, color: Colors.white)),
          FlatButton(
              onPressed: () => Navigator.pushNamed(context, MapPage.id),
              child: Icon(FontAwesomeIcons.compass, color: Colors.white)),
        ],
      ),
    );
  }
}