import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import  "events_bank_page.dart";
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:scrappy/services/event_service.dart';
import 'package:scrappy/models/event.dart';
import 'package:scrappy/models/events_bank.dart';
import 'package:scrappy/models/message.dart';
import 'package:scrappy/services/notification_service.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = '/loading_screen';
  final List filtersForQuery;

  LoadingScreen({this.filtersForQuery});

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {

  var eventService = EventService();
  var notifyService= NotificationService();

  EventBank eventBank;
  EventBank leadBank;

  List<Event> eventBankVault;
  List<Event> leadBankVault;
  int length;
  List queryFilters;
  Filters filters;

  void getEventsData(List queryFilters) async {
    await notifyService.initialise();
    if(queryFilters == null || queryFilters.length == 0){
      eventBank = await eventService.getEvents();
      eventBankVault = eventBank.vault;
    } else{
      var events = await eventService.applyFilterToEvents(queryFilters);
      eventBankVault = events;
    }

    filters = await eventService.getEventsFilters();
    leadBank = await eventService.getComputingEvents();
    leadBankVault = leadBank.vault;

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EventsBankPage(
          eventBankVault: eventBankVault,
          leadEvents: leadBankVault,
          eventFilters:filters,
      );
    }));
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  List<Message> _messages;

  @override
  void initState() {
    super.initState();
    notifyService.getToken();
    if(widget.filtersForQuery != null && widget.filtersForQuery.length > 0){
      queryFilters = widget.filtersForQuery;
    }
    getEventsData(queryFilters);
  }

  @override
  Widget build(BuildContext context) {

    print("loading screen");

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
