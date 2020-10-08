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
import 'package:scrappy/utils/eventservice.dart';

enum Gender{
  male,
  female,
}

class EventsBankPage extends StatefulWidget {
  @override
  _EventsBankPageState createState() => _EventsBankPageState();
}

class _EventsBankPageState extends State<EventsBankPage> {
  var event;

  var eventService = EventService();
  void getSingleEvent(id) async{
    event = await eventService.getEventById(id);
    print(event.id);
  }

  @override
  Widget build(BuildContext context) {
    getSingleEvent(34493879638912);
    return Scaffold(

        body:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child:
             Row(
               children: [
                 Text("CSSE Events", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: kCardColor)),
                 SizedBox(width: 100.0),
                 Icon( FontAwesomeIcons.calendar, color: kCardColor, size: 36,),
               ],
             )
            ),
            Row(
             children: [
               Text('Whats New Today', style:TextStyle(color: kCardColor))
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
            Expanded(child: Row(
              children: <Widget>[
                Icon( FontAwesomeIcons.slidersH,size: 40.0, color: Colors.blueGrey,),
                RaisedButton(
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
              ],
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
            Expanded(child:
            Row(
              children: <Widget>[
                  ButtonBar(
                    children: [
                      RaisedButton(
                          color: kCardColor,
                          child: Text('Calendar',
                            style: TextStyle(fontSize: 12.0),)
                          ,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context){
                                  return CalendarPage();
                                })
                            );
                          }),
                      RaisedButton(
                          color: kCardColor,
                          child: Text('Notifications',
                            style: TextStyle(fontSize: 12.0),)
                          ,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context){
                                  return NotificationPage();
                                }
                                )
                            );
                          }),

                      RaisedButton(
                          color: kCardColor,
                          child: Text('Maps',
                            style: TextStyle(fontSize: 12.0),)
                          ,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context){
                                  return MapPage();
                                  // return ResultsPage( bmiResult: calc.calculateBMI(), resultText: calc.getResult(), interpret: calc.getInterpretation(),);
                                }
                                )
                            );
                          }),
                    ],
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
