import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/constants.dart';


class CalendarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
