import 'package:flutter/material.dart';
import 'package:scrappy/constants.dart';
import 'package:scrappy/screens/favorites_page.dart';
import '../screens/filters_page.dart';
import '../screens/calendar_page.dart';
import '../screens/notification_page.dart';
import '../screens/map_page.dart';
import "package:scrappy/screens/loading_screen.dart";
import '../screens/events_bank_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          Expanded(child:FlatButton(
    onPressed: () => Navigator.pushNamed(context, LoadingScreen.id),
    child: Icon(FontAwesomeIcons.home, color:  kCardColor)),
          ),
          Expanded(child: FlatButton(
    onPressed: () => Navigator.pushNamed(context, FavoritesPage.id),
    child: Icon(FontAwesomeIcons.star, color: kCardColor)),
          ),
          Expanded(child:FlatButton(
    onPressed: () => Navigator.pushNamed(context, CalendarPage.id),
    child: Icon(FontAwesomeIcons.calendar, color:  kCardColor)),
          ),
          Expanded(child: FlatButton(
              onPressed: () => Navigator.pushNamed(context, MapPage.id),
              child: Icon(FontAwesomeIcons.compass, color:  kCardColor)),
          ),

        ],
      ),
    );
  }
}
