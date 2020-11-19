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
    var document;
    var _isLoading= true;

  loadKennesaw() async{
     document = await PDFDocument.fromAsset("images/kennesaw-parking-map-fall-2020.pdf");
     print("Load Kennesaw");
     setState(() {
       _isLoading = false;
     });
  }

  getKennesaw(){
    loadKennesaw();
  }

  loadMarrietta() async{
    document = await PDFDocument.fromAsset("images/marietta-map-fall-2020-v5.pdf");
    print("Load Marrietta");
    setState(() {
      _isLoading = false;
    });
  }

  getMarrietta(){
    loadMarrietta();
  }


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadKennesaw();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(
          builder: (BuildContext context) {
            final TabController tabController = DefaultTabController.of(context);
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {

                setState(() {
                  _isLoading = true;
                });

                if(tabController.index == 0 && _isLoading == false){
                  getKennesaw();
                }
                if(tabController.index == 1 && _isLoading == false){
                  getMarrietta();
                }
                // Your code goes here.
                // To get index of current tab use tabController.index
              }
            });
            return Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(text: "Kennesaw"),
                    Tab(text:"Marrietta")
                  ]
                ),
              ),
              body: TabBarView(
                children: [
                  _isLoading? CircularProgressIndicator(): PDFViewer(document: document),
                  _isLoading? CircularProgressIndicator(): PDFViewer(document: document)
                ]
              ),
            );
          }
      ),
    );
  }
}

