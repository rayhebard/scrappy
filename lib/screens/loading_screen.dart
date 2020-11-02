import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import  "events_bank_page.dart";


import 'package:scrappy/services/event_service.dart';
import 'package:scrappy/models/event.dart';
import 'package:scrappy/models/events_bank.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = '/loading_screen';
  final Filters filters;
  final List filtersForQuery;

  LoadingScreen({this.filtersForQuery, this.filters});

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
  List queryFilters;
  Filters filters;

  void getEventsData(List queryFilters) async {
    if(queryFilters == null || queryFilters.length == 0){
      eventBank = await eventService.getEvents();
      filters = await eventService.getEventsFilters();
      leadEvent = eventBank.vault[0];
      eventBankVault = eventBank.vault;
      eventBankVault.removeAt(0);
    } else{
      var events = await eventService.applyFilterToEvents(queryFilters);
      print(events);
      eventBankVault = events;
      leadEvent = eventBankVault[0];
      eventBankVault.removeAt(0);
    }



    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EventsBankPage(
          eventBankVault: eventBankVault,
          leadEvent: leadEvent,
          eventFilters:filters,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    if(widget.filtersForQuery != null && widget.filtersForQuery.length > 0){
      queryFilters = widget.filtersForQuery;
      filters = widget.filters;
    }
    getEventsData(queryFilters);
  }

  @override
  Widget build(BuildContext context) {

    // if(eventBank == null){
    //   getEventsData();
    // }

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
