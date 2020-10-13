import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/constants.dart';
import 'package:scrappy/Nav_Bar.dart';

class CalendarPage extends StatelessWidget {
  static const String id = '/Calendar_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(),
      appBar: AppBar(
          title: Text('Calendar')
      ),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Text('Calendar', style: kTItleTextStyle,)
            ],
          )
      ),
    );
  }
}
