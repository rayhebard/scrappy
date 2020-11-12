import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/components/nav_bar.dart';
import 'package:scrappy/components/pdfviewermarietta.dart';
import 'package:scrappy/components/pdfviewerkennesaw.dart';

class MapPage extends StatelessWidget {
  static const String id = '/maps';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Navbar(),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Kennesaw'),
              Tab(text:'Marietta'),
            ],
          ),
          title: Text('Campus Maps'),
        ),
        body: TabBarView(
          children: [
            pdfviewerkennesaw(),
            pdfviewermarietta(),
          ],
        ),
      ),
    );
  }
}



