import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/components/nav_bar.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';


class MapPage extends StatefulWidget {
  static const String id = '/map_page';

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  PDFDocument kennesaw;
  PDFDocument marietta;
  var _isLoading = true;

  loadMaps() async{
    kennesaw= await PDFDocument.fromAsset("images/kennesaw-parking-map-fall-2020.pdf");
    marietta= await PDFDocument.fromAsset("images/marietta-map-fall-2020-v5.pdf");
    setState(() {
      kennesaw = kennesaw;
      marietta = marietta;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMaps();
  }

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
            _isLoading? Center(child: CircularProgressIndicator())
            : PDFViewer(document: kennesaw),
            _isLoading? Center(child: CircularProgressIndicator())
                : PDFViewer(document: marietta),
          ],
        ),
      ),
    );
  }
}

