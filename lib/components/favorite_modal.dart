// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:scrappy/services/database_helper.dart';
// import 'package:scrappy/screens/favorites_page.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:scrappy/models/event.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:share/share.dart';
//
//
//
//
// class FavoriteModal extends StatefulWidget {
//   FavoriteModal({
//     @required this.event,
//     Key key, this.cancelText, this.affirmText
//   }) : super(key: key);
//
//   final Event event;
//   final String cancelText;
//   final String affirmText;
//
//
//   @override
//   _FavoriteModalState createState() => _FavoriteModalState();
// }
//
// class _FavoriteModalState extends State<FavoriteModal> {
//
//   Event event;
//   final dbHelper = DatabaseHelper.instance;
//   String cancel;
//   String affirm;
//
//
//   launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   void _insertOrDelete(int id) async {
//     final rowsPresent = await dbHelper.queryForFav(id);
//     if (rowsPresent > 0) {
//       print('Its favourite and removing it');
//       _delete();
//       isFav = false;
//
//     } else {
//       print('Nothing found so inserting you dodo');
//       _insert();
//       isFav = true;
//
//     }
//   }
//
//   void _delete() async {
//     // Assuming that the number of rows is the id for the last row.
//     final id = await dbHelper.queryRowCount();
//     final rowsDeleted = await dbHelper.delete(event.id);
//     print('deleted $rowsDeleted row(s): row $id');
//   }
//
//
//   void _query() async {
//     final allRows = await dbHelper.queryAllRows();
//     print('query all rows:');
//     allRows.forEach((row) => print(row));
//   }
//
//   void _insert() async {
//     // row to insert
//     Map<String, dynamic> row = {
//       DatabaseHelper.columnId: event.id,
//       DatabaseHelper.columnTitle: event.title,
//       DatabaseHelper.columnFirstDate: event.first_date,
//       DatabaseHelper.columnLastDate: event.last_date,
//     };
//     final id = await dbHelper.insert(row);
//     print('inserted row id: $id');
//   }
//
//   showAlertDialog(BuildContext context) {
//
//     // set up the buttons
//     Widget cancelButton = FlatButton(
//       child: Text("Cancel"),
//       onPressed:  () {
//         Navigator.of(context).pop(); // dismiss dialog
//       },
//     );
//     Widget continueButton = FlatButton(
//       child: Text("Continue to Favorite Events List"),
//       onPressed:  () => Navigator.pushReplacementNamed(context, FavoritesPage.id),
//     );
//
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("Added to Favorite Events"),
//       content: Text("Would you like to see your Favorites?"),
//       actions: [
//         cancelButton,
//         continueButton,
//
//       ],
//     );
//
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
