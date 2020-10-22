import 'package:flutter/material.dart';
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
      color: Colors.amberAccent.shade200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          Expanded(child:FlatButton(
    onPressed: () => Navigator.pushReplacementNamed(context, LoadingScreen.id),
    child: Icon(FontAwesomeIcons.home, color: Colors.white)),
          ),
          Expanded(child: FlatButton(
    onPressed: () => Navigator.pushReplacementNamed(context, FavoritesPage.id),
    child: Icon(FontAwesomeIcons.star, color: Colors.white)),
          ),
          Expanded(child:FlatButton(
    onPressed: () => Navigator.pushReplacementNamed(context, NotificationPage.id),
    child: Icon(FontAwesomeIcons.bell, color: Colors.white)), 
          ),
          Expanded(child: FlatButton(
              onPressed: () => Navigator.pushReplacementNamed(context, MapPage.id),
              child: Icon(FontAwesomeIcons.compass, color: Colors.white)),
          ),

        ],
      ),
    );
  }
}
