import 'package:scrappy/components/reusable_card.dart';
import 'package:scrappy/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/components/nav_bar.dart';
import 'package:jiffy/jiffy.dart';
import 'package:scrappy/models/event.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:scrappy/services/database_helper.dart';
import 'package:scrappy/screens/favorites_page.dart';

class EventDetailsPage extends StatelessWidget {
  static const String id = '/event_details_page';
  var isFav = false;
  final Event event;

  EventDetailsPage({
    Key key,
    this.event

  }) : super(key: key);
  final dbHelper = DatabaseHelper.instance;
  @override

  Widget build(BuildContext context) {

    print(this.event);
    String text = event.localist_url;
    String subject = event.title;
    return Scaffold(
      bottomNavigationBar: Navbar(),
      appBar:AppBar(
          title: Text('Event Details')
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child:Image.network(event.photo_url),
              ),
              Container(
                decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.amberAccent.shade100,
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                child: Text(event.title, style: kLabelTextStyle4, textAlign: TextAlign.center,),

              ),

              Container(
                  decoration:
                  BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(Jiffy(event.first_date).yMMMd + " - " + Jiffy(event.last_date).yMMMd, style: TextStyle(color: Colors.black87, fontSize: 16.0),),

                    ],
                  )
              ),

              Container(
                  decoration:
                  BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8),
                  child:Text( 'Event Type: '+ event.experince, style: kLabelTextStyle3)
              ),


              Container(
                  decoration:
                  BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8),
                  child:Text( 'Description: ' + event.location_name, style: kLabelTextStyle3 )
              ),

              Container(
                  decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey.shade100
                  ),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(15),
                  child: Text(event.description_text, style: TextStyle(color: Colors.black87 , fontSize: 16.0))
              ),

              Container(
                  padding: EdgeInsets.all(4),
                  child:
                  OutlineButton.icon(
                    color:Colors.amberAccent.shade100 ,
                    textColor: kCardColor,
                    borderSide: BorderSide(style:BorderStyle.solid),
                    icon: Icon(FontAwesomeIcons.star),
                    highlightedBorderColor: Colors.black.withOpacity(0.12),
                    onPressed: () {
                      _insert();
                      isFav = true;
                      showAlertDialog(context);
                      _insertOrDelete(id);
                    },
                    label: Text('Add to Favorites',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),),
                  )
              ),


              Container(
                  padding: EdgeInsets.all(4),
                  child:
                  OutlineButton.icon(
                    textColor: kCardColor,
                    borderSide: BorderSide(style:BorderStyle.solid),
                    icon: Icon(FontAwesomeIcons.shareAlt),
                    highlightedBorderColor: Colors.black.withOpacity(0.12),
                    onPressed: () {
                      final RenderBox box = context.findRenderObject();
                      Share.share(text,
                          subject: subject,
                          sharePositionOrigin:
                          box.localToGlobal(Offset.zero) &
                          box.size);
                    },
                    label: Text('Share',
                      style: TextStyle(fontSize: 20.0, ),),
                  )
              ),

            ],
          )
      ),
    );
  }
  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(event.id);
    print('deleted $rowsDeleted row(s): row $id');
  }
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }
  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: event.id,
      DatabaseHelper.columnTitle: event.title,
      DatabaseHelper.columnFirstDate: event.first_date,
     // DatabaseHelper.columnLastDate: event.last_date,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }
  void _checkFav(String checkId) async {
    final rowsPresent = await dbHelper.queryForFav(checkId);
    if (rowsPresent > 0) {
      print('favorited');
      isFav = true;
    } else {
      print('unfavorited');
      isFav = false;
      //_insert();
    }
    //rowsPresent.forEach((row) => print(row));
  }

  void _insertOrDelete(String id) async {
    final rowsPresent = await dbHelper.queryForFav(id);
    if (rowsPresent > 0) {
      print('Its was favourited and now it will be removed');
      _delete();
      isFav = false;
    } else {
      print('Not found on favorites list; adding to favorites');
      _insert();
      isFav = true;
    }
  }
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop(); // dismiss dialog
     },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue to Favorite Events List"),
      onPressed:  () => Navigator.pushReplacementNamed(context, FavoritesPage.id),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Added to Favorite Events"),
      content: Text("Would you like to see your Favorites?"),
      actions: [
        cancelButton,
        continueButton,

      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

