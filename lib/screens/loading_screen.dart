import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import  "events_bank_page.dart";


import 'package:scrappy/services/event_service.dart';
import 'package:scrappy/models/event.dart';
import 'package:scrappy/models/events_bank.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = '/loading_screen';
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {

  var eventService = EventService();
  EventBank eventBank;
  Event leadEvent;
  List<Event> eventBankVault;
  int length;

  void getEventsData() async {
    eventBank = await eventService.getEvents();
    leadEvent = eventBank.vault[0];
    eventBankVault = eventBank.vault;
    eventBankVault.removeAt(0);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EventsBankPage(
          eventBankVault: eventBankVault,
          leadEvent: leadEvent
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getEventsData();
  }

  @override
  Widget build(BuildContext context) {
    getEventsData();
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
