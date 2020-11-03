import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/components/nav_bar.dart';
import 'package:scrappy/models/Favorites.dart';
import 'package:scrappy/services/database_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrappy/constants.dart';
import 'package:scrappy/models/event.dart';
import 'package:scrappy/models/events_bank.dart';
import 'package:scrappy/screens/event_details_page.dart';

class FavoritesPage extends StatefulWidget {
  static const String id = '/favorites';
  final List<Event> FaveventBankVault;
  final Event event;
  FavoritesPage({ this.FaveventBankVault, this.event });
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  EventBank FaveventBank;
  List<Event> vault;
  int length;

  final dbHelper = DatabaseHelper.instance;
  List<Favorites> favList = new List();
  @override
  void initState() {
    super.initState();

    DatabaseHelper.instance.queryAllRows().then((value) {
      setState(() {
        value.forEach((element) {
          favList.add(Favorites(id: element['id'], title: element["title"]));
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
          title: Text('Scrappy')
      ),
      body: Container(

        child: favList.isEmpty ? Center(child: Text('You have not favorited any events', style:kLabelTextStyle4 ,)) :
        ListView.builder(itemBuilder: (ctx, index) {
          if (index == favList.length) return null;
          return Dismissible(
            background: stackBehindDismiss(),
            key: ObjectKey(favList[index]),
            child: ListTile(

                tileColor: Colors.amber,
                title: Text(favList[index].title, textAlign: TextAlign.center, ),
                leading: Icon(FontAwesomeIcons.solidStar,),
                trailing: Icon(FontAwesomeIcons.trashAlt),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EventDetailsPage(event: vault[index]);
                  }));
                }),
            onDismissed: (direction) {
              var item = favList.elementAt(index);
              //To delete
              deleteItem(index);
              _delete();

            },
          );
        }),
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
  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    //final rowsDeleted = await dbHelper.delete(event.id);
    //print('deleted $rowsDeleted row(s): row $id');
  }
}
