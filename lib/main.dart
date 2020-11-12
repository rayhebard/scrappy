import 'package:flutter/material.dart';
import 'package:scrappy/screens/login_page.dart';
import 'screens/calendar_page.dart';
import 'screens/events_bank_page.dart';
import 'screens/event_details_page.dart';
import 'screens/filters_page.dart';
import 'screens/favorites_page.dart';
import 'screens/map_page.dart';
import 'screens/notification_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/loading_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';


void main(){
  initializeDateFormatting().then((_) => runApp(Scrappy()));
}

class Scrappy extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarColor: Colors.white,
        accentColor: Colors.amberAccent,
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'SourceSans-Pro',
        ),
        primaryTextTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'SourceSans-Pro',
        ),
        accentTextTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'SourceSans-Pro',
        ),
      ),
      home: LoginPage(),
      routes: {
        EventsBankPage.id:(context)=>EventsBankPage(),
        EventDetailsPage.id : (context)=>EventDetailsPage(),
        FavoritesPage.id:(context)=>FavoritesPage(),
        FiltersPage.id:(context)=>FiltersPage(),
        MapPage.id:(context)=>MapPage(),
        NotificationPage.id:(context)=>NotificationPage(),
        LoadingScreen.id:(context)=>LoadingScreen(),
        CalendarPage.id:(context)=>CalendarPage()
      },
    );
  }
}








