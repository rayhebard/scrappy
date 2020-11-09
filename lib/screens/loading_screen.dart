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
  EventBank leadBank;

  List<Event> eventBankVault;
  List<Event> leadBankVault;
  int length;
  List queryFilters;
  Filters filters;

  void getEventsData(List queryFilters) async {
    if(queryFilters == null || queryFilters.length == 0){
      eventBank = await eventService.getEvents();
      filters = await eventService.getEventsFilters();
      leadBank = await eventService.getComputingEvents();
      eventBankVault = eventBank.vault;
      leadBankVault = leadBank.vault;
    } else{
      var events = await eventService.applyFilterToEvents(queryFilters);
      eventBankVault = events;
      eventBankVault.removeAt(0);
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EventsBankPage(
          eventBankVault: eventBankVault,
          leadEvents: leadBankVault,
          eventFilters:filters,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.filtersForQuery != null && widget.filtersForQuery.length > 0){
      queryFilters = widget.filtersForQuery;
      filters = widget.filters;
    }
    getEventsData(queryFilters);

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
