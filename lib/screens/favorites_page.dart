import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrappy/Nav_Bar.dart';
class FavoritesPage extends StatefulWidget {
  static const String id = '/favorites';

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(),
      appBar:AppBar(
          title: Text('Scrappy')
      ),
    );
  }
}
