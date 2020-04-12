import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final Function onTap;
  final String lable;

  const AccountButton({Key key, @required this.onTap, @required this.lable})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        height: 40.0,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          lable,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
