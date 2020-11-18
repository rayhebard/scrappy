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
import 'package:url_launcher/url_launcher.dart';
import 'package:add_2_calendar/add_2_calendar.dart' as add;



class EventDetailsPage extends StatelessWidget {
  static const String id = '/event_details_page';

  final Event event;
  EventDetailsPage({
    Key key,
    this.event
  }) : super(key: key);

  final dbHelper = DatabaseHelper.instance;
  bool isFav = false;

  Future<bool> _favQuery() async {
    final rowsPresent = await dbHelper.queryForFav(event.id);
    if (rowsPresent > 0) {
      print('event is in database');
      isFav = true;
      return true;
    }
  }



  @override
  Widget build(BuildContext context) {

    print(this.event);
    String text = event.localist_url;
    String subject = event.title;

     DateTime first_date = DateTime.parse(event.first_date);
     DateTime last_date = DateTime.parse(event.last_date);

    final add.Event selected_event = add.Event(
      title: event.title,
      description: event.description,
      location: event.location,
      startDate: first_date,
      endDate: last_date,
    );

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
                      Text(Jiffy(event.first_date).yMMMd + " - " + Jiffy(event.last_date).yMMMd, style: kLabelTextStyle3),
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
              SizedBox(height: 30,
              ),


              Container(
                  height: 60.0,
                  padding: EdgeInsets.all(4),
                  child:
                  RaisedButton.icon(
                    textColor: kCardColor,
                    color: Colors.amberAccent.shade100,
                    icon: Icon(FontAwesomeIcons.infoCircle),
                    onPressed: () {
                      String url;
                      event.url == null ?  url = event.localist_url : url = event.url;
                      launchURL(url);
                    },
                    label: Text('Event Info Page',
                      style: TextStyle(fontSize: 20.0, ),),
                  )
              ),
              Container(
                height: 60.0,
                  padding: EdgeInsets.all(4),
                  child:
                  RaisedButton.icon(
                    textColor: kCardColor,
                   color: Colors.amberAccent.shade100,
                    icon: Icon(FontAwesomeIcons.shareAlt),
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
              Container(
                  height: 60.0,
                  padding: EdgeInsets.all(4),
                  child:
                  RaisedButton.icon(
                    color:Colors.amberAccent.shade100 ,
                    textColor: kCardColor,
                    icon: Icon(FontAwesomeIcons.plusCircle),
                    onPressed: () {
                      add.Add2Calendar.addEvent2Cal(selected_event);
                    },
                    label: Text('Add to Personal Calendar',
                      style: TextStyle(fontSize: 20.0, ),),
                  )
              ),

              Container(
                      height: 60.0,
                      padding: EdgeInsets.all(4),
                      child:
                      RaisedButton.icon(
                        color:kCardColor,
                        textColor: Colors.white,
                        icon: isFav == false ? Icon(FontAwesomeIcons.star):Icon(FontAwesomeIcons.solidStar),
                        onPressed: () {
                          _insertOrDelete(event.id);
                          showAlertDialog(context);
                          (context as Element).markNeedsBuild();
                        },
                        label: Text('Add to Favorites',
                          style: TextStyle(fontSize: 20.0, ),),
                      )
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
                      _query();
                    },
                    label: Text('Query',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),),
                  )
              ),
            ],
          )
      ),
    );
  }


  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _insertOrDelete(int id) async {
    final rowsPresent = await dbHelper.queryForFav(id);
    if (rowsPresent > 0) {
      print('Its favourite and removing it');
      _delete();
        isFav = false;

    } else {
      print('Nothing found so inserting you dodo');
      _insert();
        isFav = true;

    }
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
      DatabaseHelper.columnLastDate: event.last_date,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
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

