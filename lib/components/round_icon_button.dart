import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
         elevation: 0.0,
        child: Icon(icon),
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(
          width: 48.0,
          height:48.0
        ),
        shape: CircleBorder(),
       fillColor: Color(0xff4C4f5e),
    );
  }
}
