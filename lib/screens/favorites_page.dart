import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/components/nav_bar.dart';
import 'package:scrappy/models/Favorites.dart';
import 'package:scrappy/services/database_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrappy/constants.dart';
class FavoritesPage extends StatefulWidget {
  static const String id = '/favorites';

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
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

        child: ListView.builder(itemBuilder: (ctx, index) {
          if (index == favList.length) return null;
          return ListTile(

            tileColor: Colors.amber,
            title: Text(favList[index].title, textAlign: TextAlign.center, ),
            leading: Icon(FontAwesomeIcons.star,),
            trailing: Icon(FontAwesomeIcons.trashAlt),
          );
        }),
      ),
    );
  }
}
