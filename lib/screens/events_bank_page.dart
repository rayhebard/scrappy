//Packages from Pubspec
import 'package:scrappy/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';


//Internal files
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'event_tags_page.dart';
import 'calendar_page.dart';
import 'notification_page.dart';
import 'map_page.dart';
import 'package:scrappy/services/event_service.dart';
import 'package:scrappy/models/event.dart';
import 'package:scrappy/models/events_bank.dart';
import 'package:scrappy/components/nav_bar.dart';




class EventsBankPage extends StatefulWidget {
  static const String id = '/event_bank';
  @override
  _EventsBankPageState createState() => _EventsBankPageState();
}

class _EventsBankPageState extends State<EventsBankPage> {
  var event;
  EventBank eventBank;

  var eventService = EventService();
  void getSingleEvent(id) async{
    event = await eventService.getEventById(id);
    print(event.id);
  }

  void getEvents()async{
    print("calling get events");
     eventBank = await eventService.getEvents();
     print(eventBank.vault[0].photo_url);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hi");
    getEvents();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: Navbar(),

      body:Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height:100.0,
              // color: Colors.grey.shade200,

              child: Row(
                children: [
                  Expanded(child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0,),),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "CCSE Events",
                            style: kTItleTextStyle ,
                          )
                      ),
                      Padding(padding: EdgeInsets.only(left:16.0,)),
                      Expanded(
                        // alignment: Alignment.centerRight,
                        child: RaisedButton.icon(
                          color:Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                            ),
                            onPressed: (){
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                              return CalendarPage();})
                                );
                            },
                            icon: Icon(FontAwesomeIcons.calendarAlt,),
                            label: Text('Calendar'))
                      ),
                    ],
                  )
                  ),
                ],
              )
          ),
          
          Row(
              children: [
                Expanded(
                    child: RaisedButton.icon(
                        color: kCardColor,
                        icon: Icon(FontAwesomeIcons.filter),
                        label: Text('Select Filters',
                          style: TextStyle(fontSize: 20.0),)
                        ,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context){
                                return EventTagsPage();
                              }
                              )
                          );
                        })
                )
              ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left:30.0,top:10.0),),
              Text('Whats New Today', style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20.0 ,color: kCardColor)),

            ],
          ),
          Expanded(
              child: ReusableCard(
                colour: kHootyHooGold,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.star),
                    Text(eventBank.vault[0].title, style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "From: " + Jiffy(eventBank.vault[0].first_date).yMMMd,
                          style: TextStyle(color: Colors.black87),
                        ),
                        Text(
                          " - To: " + Jiffy(eventBank.vault[0].last_date).yMMMd,
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Join us',
                        )
                      ],)
                  ],
                ),
              )),

          Expanded(
              child: Row(
                  children: <Widget> [
                    Expanded(
                        child: ReusableCard(
                            onPress: (){
                              setState(() {

                              });
                            },
                            cardChild: IconContent( icon: FontAwesomeIcons.star, label: 'CSE Industry Talks',),
                            colour: kSlapRockGray)
                    ),
                    Expanded(
                        child: ReusableCard(
                          onPress: (){
                            setState(() {

                            });
                          },
                          cardChild: IconContent( icon: FontAwesomeIcons.star, label: 'Dean Speaks',),
                          colour: kCardColor,
                        )
                    ),
                  ]
              )
          ),
        ],
      ),

    );
  }
}