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
    return Scaffold(
      bottomNavigationBar: Navbar(),
      appBar:AppBar(
          title: Text('Campus Maps')
      ),
      body: Builder(builder:(context)=>
      Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:20.0),
              Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    RaisedButton(
                        color:Colors.amberAccent,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>pdfviewermarietta()));
                        },
                        child:Text('Marietta Campus Map', style: TextStyle(color:kCardColor))
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0,),),
                    RaisedButton(
                        color:Colors.amberAccent,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>pdfviewerkennesaw()));
                        },
                        child:Text('Kennesaw Campus Map', style: TextStyle(color:kCardColor))
                    )
                  ],
                ),
              ),

            ],
          )
      ),
      )
    );
  }
}
