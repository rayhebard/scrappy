import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/components/nav_bar.dart';
import 'package:scrappy/models/favorites.dart';
import 'package:scrappy/services/database_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrappy/constants.dart';
import 'package:scrappy/models/event.dart';
import 'package:scrappy/models/events_bank.dart';
import 'package:scrappy/screens/event_details_page.dart';
import 'package:scrappy/services/event_service.dart';
import 'package:jiffy/jiffy.dart';

class FavoritesPage extends StatefulWidget {
  static const String id = '/favorites';

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  var eventService = EventService();

  final dbHelper = DatabaseHelper.instance;
  List<Favorites> favList = new List();
  bool isOver = false;
  @override
  void initState() {
    super.initState();

    DatabaseHelper.instance.queryAllRows().then((value) {
      setState(() {
        value.forEach((element) {
          favList.add(Favorites(id: element['id'], title: element["title"],first_date: element["first_date"],last_date: element["last_date"], ));
        });
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: Navbar(),
      appBar:AppBar(
          title: Text('Favorite Events')
      ),
      body:

      Container(

        child: favList.isEmpty ? Center(child: Text('You have not favorited any events', style:kLabelTextStyle4 ,textAlign: TextAlign.center,)) :

        ListView.separated(

            itemCount: favList.length,
            itemBuilder: (ctx, index) {
          var eventID = favList[index].id;
          if (index == favList.length) return null;

          var LastDate = DateTime.parse(favList[index].last_date);
          DateTime TodayDate = new DateTime.now();
          print(TodayDate.isBefore(LastDate));

          return Dismissible(
            background: stackBehindDismiss(),
            key: ObjectKey(favList[index]),
            child: ListTile(
                tileColor: Colors.amberAccent.shade100,
                title: Text(favList[index].title, textAlign: TextAlign.center, style:TextStyle(color: kCardColor, fontSize: 22,)),
                subtitle:
              Column(
                  children: <Widget>[
                    Text(Jiffy(favList[index].first_date).yMMMd +' - '+ Jiffy(favList[index].last_date).yMMMd ?? '', textAlign: TextAlign.center, style:TextStyle(color: kCardColor, fontSize: 18,)),
                    if (TodayDate.isAfter(LastDate) == true)
                      Text('\n' + "This Event is Over", style:TextStyle(color: Colors.redAccent, fontSize: 18,)),
                  ],
              ),

                leading: Icon(FontAwesomeIcons.solidStar,color:  kCardColor),
                onTap: () async{
                  var selectedEvent = await eventService.getEventById(favList[index].id);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EventDetailsPage(event: selectedEvent);
                  }
                  )
                  );
                }),
            onDismissed: (direction) {
              var item = favList.elementAt(index);
              int eventID = favList[index].id;
              //To delete
              deleteItem(index);
              _delete(eventID);
            },
          );
        },
            separatorBuilder: (context, index) {
          return Divider();
        }
        ),
      ),
    );
  }


  Widget stackBehindDismiss() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        FontAwesomeIcons.trashAlt,
        color: Colors.white,
      ),
    );
  }

  void deleteItem(index) {
    /*
    By implementing this method, it ensures that upon being dismissed from our widget tree,
    the item is removed from our list of items and our list is updated, hence
    preventing the "Dismissed widget still in widget tree error" when we reload.
    */
    setState(() {
      favList.removeAt(index);
    });
  }
  void _delete(eventID) async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(eventID);
    print('deleted $rowsDeleted row(s): row $id');
  }
}
