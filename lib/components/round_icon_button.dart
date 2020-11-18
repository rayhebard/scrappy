import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed, this.color});

  final IconData icon;
  final Function onPressed;
  final color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
         elevation: 0.0,
        child: Icon(icon, color: color,),
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(
          width: 48.0,
          height:48.0
        ),
        shape: CircleBorder(),
       fillColor: Colors.white,
    );
  }
}
