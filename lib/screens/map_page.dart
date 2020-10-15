import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/constants.dart';
import 'package:scrappy/components/nav_bar.dart';
class MapPage extends StatelessWidget {
  static const String id = '/maps';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(),
      appBar:AppBar(
          title: Text('Scrappy')
      ),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Text('Campus Maps', style: kTItleTextStyle,)
            ],
          )
      ),
    );
  }
}
