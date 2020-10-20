//Packages from Pubspec
import 'package:scrappy/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import'package:flutter_svg/flutter_svg.dart';
import 'package:scrappy/screens/event_details_page.dart';



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
import 'package:scrappy/screens/calendar_loader.dart';

const CCSE_hori_Logo='images/KSU_on light backgrounds/KSU_SVG LOGO/BE_Horiz_2Clr_Computing and Software.svg';


class EventsBankPage extends StatefulWidget {
  static const String id = '/event_bank';
  final Event leadEvent;
  final List<Event> eventBankVault;
  EventsBankPage({this.leadEvent, this.eventBankVault});

  @override
  _EventsBankPageState createState() => _EventsBankPageState();
}

class _EventsBankPageState extends State<EventsBankPage> {
  var eventService = EventService();
  EventBank eventBank;
  Event topEvent;
  List<Event> vault;
  int length;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.leadEvent, widget.eventBankVault);
  }

  void updateUI( Event leadEvent, List<Event> eventBankVault) {
    setState(() {
      topEvent = leadEvent;
      vault = eventBankVault;
      length = vault.length;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: Navbar(),

      body:SafeArea(
        child: Scrollbar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  height:100.0,
                  color: Colors.amber.shade200,

                  child: Row(
                    children: [
                      Expanded(child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0,),),
                          Align(
                              alignment: Alignment.center,
                              child: Image(
                                image:AssetImage('images/KSU_on light backgrounds/KSU_PNG LOGO/BE_Horiz_3Clr_Computing and Software.png'),

                                width: 250.0 ,
                              ),
                          ),
                          Padding(padding: EdgeInsets.only(left:16.0,)),
                          Expanded(
                            // alignment: Alignment.centerRight,
                            child: RawMaterialButton(
                              elevation: 2.0,
                              fillColor: kCardColor,
                              child: Icon(
                                FontAwesomeIcons.calendarAlt,
                                size: 35.0,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                              // onPressed: () => Navigator.pushReplacementNamed(context, CalendarPage.id),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return CalendarLoader();
                                }));
                              },

                            )
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
                    onPress: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EventDetailsPage(event:topEvent);
                      }));
                    },
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.star),
                        Text(topEvent.title, style: kLabelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "From: " + Jiffy(topEvent.first_date).yMMMd,
                              style: TextStyle(color: Colors.black87),
                            ),
                            Text(
                              " - To: " + Jiffy(topEvent.last_date).yMMMd,
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
                  child: GridView.builder(
                  itemCount: length - 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0
                  ),
                  itemBuilder: (BuildContext content, int index){
                    return ReusableCard(
                        onPress: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return EventDetailsPage(event:vault[index]);
                          }));
                        },
                        cardChild: IconContent( icon: FontAwesomeIcons.star, label: vault[index].title,),
                        colour: kCardColor);
                  },
                )
              ),
            ],
          ),
        ),
      ),

    );
  }
}