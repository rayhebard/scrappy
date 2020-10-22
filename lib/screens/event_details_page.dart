import 'package:scrappy/components/reusable_card.dart';
import 'package:scrappy/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/components/nav_bar.dart';
import 'package:jiffy/jiffy.dart';
import 'package:scrappy/models/event.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class EventDetailsPage extends StatelessWidget {
  static const String id = '/event_details_page';

  final Event event;

  const EventDetailsPage({
    Key key,
    this.event
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    print(this.event);
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
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                         Colors.amber,
                         Colors.yellow,
                         Colors.amber,
                        ],
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
              child: Text(event.title, style: kTitleStyle, textAlign: TextAlign.center),
              ),

            Container(
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5),
                child: Text( 'Date: '+(event.first_date)+' to '+(event.last_date), style: kLabelTextStyle3 ,textAlign: TextAlign.center)
            ),

            Container(
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5),
                child:Text( 'Time: ', style: kLabelTextStyle3 ,textAlign: TextAlign.center)
            ),
            Container(
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5),
                child:Text( 'Location: ' + event.location_name, style: kLabelTextStyle3 ,textAlign: TextAlign.center)
            ),

           Container(
               decoration:
               BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(20)),
                 gradient: LinearGradient(
                   begin: Alignment.topRight,
                   end: Alignment.bottomLeft,
                   colors: [
                     Color(0xFF1d1E33),
                     Colors.black,
                     Color(0xFF1d1E33)
                   ],
                 ),
               ),
               width: MediaQuery.of(context).size.width,
               padding: EdgeInsets.all(15),
             child: Text(event.description_text, style: kLabelTextStyleW,)
           ),
            Container(
                decoration:
            BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            padding: EdgeInsets.all(15),
                child:
                FlatButton.icon(
                  height: 45,
                color: Colors.grey,
                icon: Icon(FontAwesomeIcons.star),
                label: Text('Add to Favorite Events List',
                  style: TextStyle(fontSize: 20.0),),
                onPressed: (){

                })
            ),
            Container(
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.all(15),
                child:
                FlatButton.icon(
                    height: 45,
                    color: Colors.grey,
                    icon: Icon(FontAwesomeIcons.shareAlt),
                    label: Text('Share',
                      style: TextStyle(fontSize: 20.0, ),),
                    onPressed: (){

                    })
            ),

          ],
        )
      ),
    );
  }
}
