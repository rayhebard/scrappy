import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/services/database_helper.dart';
import 'package:scrappy/screens/favorites_page.dart';
import 'package:scrappy/models/event.dart';



class FavoriteService{
  final Event event;
  final String cancelText;
  final String affirmText;
  final dbHelper = DatabaseHelper.instance;
  var allRows;

  FavoriteService({
    this.event, this.cancelText, this.affirmText
  });

  init() {
    query();
  }
  insertOrDelete(String id) async {
    final rowsPresent = await dbHelper.queryForFav(id);
    if (rowsPresent > 0) {
      print('Its favourite and removing it');
      _delete();

    } else {
      print('Nothing found so inserting you dodo');
      _insert();
    }
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(event.id);
    print('deleted $rowsDeleted row(s): row $id');
  }

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: event.id,
      DatabaseHelper.columnTitle: event.title,
      DatabaseHelper.columnFirstDate: event.first_date,
      DatabaseHelper.columnLastDate: event.last_date,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void query() async {
    allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
    return allRows;
  }

  var isFav = (String id, List allRows) => (
      (allRows == null || allRows != null && allRows.length  <= 0)? false : ((allRows.where((row)=>(row["id"].contains(id)))).length > 0)? true : false);

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(cancelText),
      onPressed:  () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );
    Widget continueButton = FlatButton(
      child: Text(affirmText),
      onPressed:  () => Navigator.pushReplacementNamed(context, FavoritesPage.id),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Added to Favorite Events"),
      content: Text("Would you like to see your Favorites?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

