import 'package:flutter/material.dart';
import '../constants.dart';


class IconContent extends StatelessWidget {

  final String label;
  final IconData icon;
  final String start;
  final String end;

  IconContent({this.icon, this.label, this.start, this.end});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox( height: 15.0,
        ),
        SizedBox( height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              label, overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
         "From: $start"
        ),
        Text(
          "To: $end"
        )
      ],
    );
  }
}