import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/constants.dart';
import 'package:scrappy/components/nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:scrappy/components/pdfviewermarietta.dart';
import 'package:scrappy/components/pdfviewerkennesaw.dart';

class MapPage extends StatefulWidget {
  static const String id = '/maps';
  @override
  _MapPageState createState() => _MapPageState();
}


class _MapPageState extends State<MapPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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

