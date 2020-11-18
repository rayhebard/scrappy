//Packages from Pubspec
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';


//Internal files
import 'package:scrappy/screens/event_details_page.dart';
import 'package:scrappy/models/event.dart';


class ImageCard extends StatelessWidget {
  const ImageCard({
    Key key,
    @required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EventDetailsPage(event: event);
        })
        )},
      child: Container(
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)), color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 5.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: <Widget>[
                Image.network(
                  event.photo_url,
                  width: 140,
                  height: double.infinity,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration:
                          BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.amberAccent.shade100,
                          ),
                          child: Text(
                            event.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black87,fontSize: 20,  fontWeight: FontWeight.bold ),
                          ),
                        ),
                        SizedBox(
                          height:10,
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child:Text(
                            "From: " + Jiffy(event.first_date).yMMMd+'\n'+"To: " + Jiffy(event.last_date).yMMMd,
                            style: TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}