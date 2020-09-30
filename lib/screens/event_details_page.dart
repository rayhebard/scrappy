import 'package:scrappy/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
