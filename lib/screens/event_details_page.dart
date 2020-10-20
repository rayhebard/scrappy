import 'package:scrappy/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/components/nav_bar.dart';

import 'package:scrappy/models/event.dart';

class EventDetailsPage extends StatelessWidget {
  static const String id = '/event_details_page';

  final Event event;

  const EventDetailsPage({
    Key key,
    this.event
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    print(this.event);
    return Scaffold(
      bottomNavigationBar: Navbar(),
      appBar:AppBar(
          title: Text('Scrappy')
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('Event Details', style: kTItleTextStyle,)
          ],
        )
      ),
    );
  }
}
