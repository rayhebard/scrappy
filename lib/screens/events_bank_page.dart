import 'package:scrappy/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
import 'package:scrappy/Nav_Bar.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
     eventBank = await eventService.getEvents();
     print(eventBank.vault[0].title);
  }

  @override
  Widget build(BuildContext context) {
    var event = getSingleEvent(34493879638912);
    getEvents();

    return Scaffold(
      bottomNavigationBar: Navbar(),

      body:Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height:100.0,
              color: Colors.amber,

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
                      Padding(padding: EdgeInsets.only(left:40.0,)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton.icon(
                          color:Colors.black,
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

          Container(
              width: MediaQuery.of(context).size.width,
              height:50.0,
              color: Colors.grey,

              child: RaisedButton(
                      color: kCardColor,
                      child: Text('Select Filters',
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
                    Text("Black Rock Lecture Series", style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          'September 2nd 6-7pm Microsoft Teams',
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