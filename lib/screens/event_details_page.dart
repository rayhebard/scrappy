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
import 'package:scrappy/services/favorites_service.dart';



class EventDetailsPage extends StatelessWidget {
  static const String id = '/event_details_page';

  final Event event;

  EventDetailsPage({
    Key key,
    this.event
  }) : super(key: key);

  FavoriteService favServe;

  // final dbHelper = DatabaseHelper.instance;
  bool isFav = false;


  @override
  Widget build(BuildContext context) {

    String text = event.localist_url;
    String subject = event.title;

     DateTime first_date = event.start;
     DateTime last_date = event.end;

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
                      event.url == ""?  url = event.localist_url : url = event.url;
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
                           favServe = FavoriteService(event: event, cancelText: "Cancel", affirmText: "Continue to Favorite Events List",);
                           favServe.insertOrDelete(event.id.toString());
                           favServe.showAlertDialog(context);
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
                      // _query();
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

  //Code to Access the External WebPage
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}

