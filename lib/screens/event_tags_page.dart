import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrappy/components/nav_bar.dart';
class EventTagsPage extends StatefulWidget {
  static const String id = '/event_tags';
  @override
  _EventTagsPageState createState() => _EventTagsPageState();
}

class _EventTagsPageState extends State<EventTagsPage> {
  bool _isChecked = true;
  void onChanged(bool value){
    setState(() {
_isChecked=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Navbar(),
      appBar:AppBar(
          title: Text('Event Tags')
      ),
      body:
      new Container(

          child: Column(

            children:<Widget>[

              Padding(
              padding: EdgeInsets.only(top: 10.0)),

              Expanded(

                  child: ListView(
                  children: <Widget>[

                    new Text("Time of Day Filters", style: kLabelTextStyle2,),
                    new CheckboxListTile(
                        title: new Text("Morning Events", style: kLabelTextStyle ),
                        secondary: const Icon(FontAwesomeIcons.checkCircle),
                        activeColor: Colors.amberAccent,

                        value: _isChecked,
                        onChanged: (bool value){onChanged(value);}),
                    new CheckboxListTile(
                        title: new Text("Afternoon Events", style: kLabelTextStyle),
                        activeColor: Colors.amberAccent,
                        secondary: const Icon(FontAwesomeIcons.checkCircle),
                        value: _isChecked,
                        onChanged: (bool value){onChanged(value);}),
                    new CheckboxListTile(
                        title: new Text("Evening Events", style: kLabelTextStyle),
                        activeColor: Colors.amberAccent,
                        secondary: const Icon(FontAwesomeIcons.checkCircle),
                        value: _isChecked,
                        onChanged: (bool value){onChanged(value);}),
                    new Text("Event Meeting Type", style: kLabelTextStyle2,),
                    new CheckboxListTile(
                        title: new Text("In-Person Events", style: kLabelTextStyle),
                        activeColor: Colors.amberAccent,
                        secondary: const Icon(FontAwesomeIcons.checkCircle),
                        value: _isChecked,
                        onChanged: (bool value){onChanged(value);}),
                    new CheckboxListTile(
                        title: new Text("Virtual Events", style: kLabelTextStyle),
                        activeColor: Colors.amberAccent,
                        secondary: const Icon(FontAwesomeIcons.checkCircle),
                        value: _isChecked,
                        onChanged: (bool value){onChanged(value);}),
                    new Text("Event Type", style: kLabelTextStyle2,),
                    new CheckboxListTile(
                        title: new Text("Lecture Events", style: kLabelTextStyle),
                        activeColor: Colors.amberAccent,
                        secondary: const Icon(FontAwesomeIcons.checkCircle),
                        value: _isChecked,
                        onChanged: (bool value){onChanged(value);}),
                    new CheckboxListTile(
                        title: new Text("Career Networking Events", style: kLabelTextStyle),
                        activeColor: Colors.amberAccent,
                        secondary: const Icon(FontAwesomeIcons.checkCircle),
                        value: _isChecked,
                        onChanged: (bool value){onChanged(value);}),
                    new CheckboxListTile(
                        title: new Text("Social Events", style: kLabelTextStyle),
                        activeColor: Colors.amberAccent,
                        secondary: const Icon(FontAwesomeIcons.checkCircle),
                        value: _isChecked,
                        onChanged: (bool value){onChanged(value);}),
                    new CheckboxListTile(
                        title: new Text("Competition Events", style: kLabelTextStyle),
                        activeColor: Colors.amberAccent,
                        secondary: const Icon(FontAwesomeIcons.checkCircle),
                        value: _isChecked,
                        onChanged: (bool value){onChanged(value);}),
  ]
              )),


            ],
          ),
  )
    );
  }
}
