import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import  "events_bank_page.dart";


import 'package:scrappy/services/event_service.dart';
import 'package:scrappy/models/event.dart';
import 'package:scrappy/models/events_bank.dart';
import 'package:scrappy/screens/calendar_page.dart';



class CalendarLoader extends StatefulWidget {
  static const String id = '/calendar_loader';
  @override
  _CalendarLoaderState createState() => _CalendarLoaderState();
}

class _CalendarLoaderState extends State<CalendarLoader> {

  var eventService = EventService();
  List<Event> vault;

  List organizeByDateTime(List list){

  }

  void getCalendarData() async {

    List eventVault = await eventService.getCalendarEvents();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CalendarPage(
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getCalendarData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black87,
          size: 100.0,
        ),
      ),
    );
  }
}
