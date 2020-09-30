import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/constants.dart';

class EventTagsPage extends StatefulWidget {
  @override
  _EventTagsPageState createState() => _EventTagsPageState();
}

class _EventTagsPageState extends State<EventTagsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: Text('Scrappy')
      ),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Text('Event Tags', style: kTItleTextStyle,)
            ],
          )
      ),
    );
  }
}
