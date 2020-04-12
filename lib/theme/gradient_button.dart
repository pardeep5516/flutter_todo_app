import 'package:flutter/material.dart';
import 'package:todo/rules/constants.dart';

class GradientButton extends StatelessWidget {
  final Function onTap;
  final String label;
  final Color color1;
  final Color color2;

  const GradientButton(
      {Key key,
      @required this.onTap,
      @required this.label,
      @required this.color1,
      @required this.color2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              color1,
              color2,
            ],
          ),
          borderRadius: BorderRadius.circular(
            (32.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(5, 5),
              spreadRadius: 0.0,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Center(
          child: Text(label, style: kGredientButtonTextStyle),
        ),
      ),
    );
  }
}
