
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, this.colour, @required this.onPressed, this.textColour, this.elevation});

  final Color colour;
  final String title;
  final Function onPressed;
  final Color textColour;
  final double elevation;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        elevation: elevation,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 280.0,
          height: 50.0,
          child: Text(
              title,
              style: TextStyle(
                color: textColour, fontSize: 20
              )
          ),
        ),
      ),
    );
  }
}


