import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/constants.dart';

class MapPage extends StatelessWidget {
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
