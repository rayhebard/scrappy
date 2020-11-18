//Packages from Pubspec
import 'package:scrappy/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';


//Internal files
import '../constants.dart';
import 'filters_page.dart';
import 'package:scrappy/screens/event_details_page.dart';
import 'package:scrappy/services/event_service.dart';
import 'package:scrappy/models/event.dart';
import 'package:scrappy/models/events_bank.dart';
import 'package:scrappy/components/nav_bar.dart';
import 'package:scrappy/screens/notification_page.dart';
import 'package:scrappy/components/lead_card.dart';
import 'package:scrappy/components/image_card.dart';


const CCSE_hori_Logo='images/KSU_on light backgrounds/KSU_SVG LOGO/BE_Horiz_2Clr_Computing and Software.svg';


class EventsBankPage extends StatefulWidget {
  static const String id = '/event_bank';
  final List<Event> leadEvents;
  final List<Event> eventBankVault;
  final Filters eventFilters;
  EventsBankPage({this.leadEvents, this.eventBankVault, this.eventFilters});

  @override
  _EventsBankPageState createState() => _EventsBankPageState();
}

class _EventsBankPageState extends State<EventsBankPage> {
  var eventService = EventService();
  EventBank eventBank;
  Event topEvent;
  Filters filtersForEvents;
  List<Event> vault;
  List<Event> leads;
  int length;
  var cScroller;

   // / final ComputerScroller cScroller = ComputerScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.leadEvents, widget.eventBankVault, widget.eventFilters);

    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });

  }

  void updateUI( List<Event> leadEvents, List<Event> eventBankVault, Filters eventFilters) {
    setState(() {
      leads = leadEvents;
      vault = eventBankVault;
      length = vault.length;
      filtersForEvents = eventFilters;
      cScroller = ComputerScroller(event:  leads[0]);
    });
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.30;

    return Scaffold(
      bottomNavigationBar: Navbar(),
      body:SafeArea(
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
                              FontAwesomeIcons.bell,
                              size: 35.0,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                            // onPressed: () => Navigator.pushReplacementNamed(context, CalendarPage.id),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return NotificationPage();
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

                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
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
                                  return FiltersPage(filters: filtersForEvents );
                                }
                                )
                            );
                          })
                  )
                ],
            ),
            SizedBox(height:20),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:30.0,),),
                Text('Current Happenings', style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20.0 ,color: kCardColor)),

              ],
            ),

              AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: closeTopContainer?0:1,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer?0:categoryHeight,
                    child: cScroller),
              ),
            
            Expanded(
                child: ListView.builder(
                    controller: controller,
                    itemCount: vault.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      double scale = 1.0;
                      return Opacity(
                        opacity: scale,
                        child: Transform(
                          transform:  Matrix4.identity()..scale(scale,scale),
                          alignment: Alignment.bottomCenter,
                          child: ImageCard(event:vault[index]),
                        ),
                      );
                    }))
          ],
        ),
      ),

    );
  }
}


class ComputerScroller extends StatelessWidget {

  final Event event;

  const ComputerScroller({this.event});

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 200,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              LeadCard(event: event),
              LeadCard(event: event)
            ],
          ),
        ),
      ),
    );
  }
}



