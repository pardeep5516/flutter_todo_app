import 'package:flutter/material.dart';

const kAuthorNameStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w500,
  color: Colors.white38,
);

const kGredientButtonTextStyle = TextStyle(
  color: Colors.white38,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

const kTextFieldInputDecoration = InputDecoration(
  labelText: 'Enter a value',
  labelStyle: TextStyle(
    color: Colors.white54,
    fontWeight: FontWeight.w700,
  ),
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orangeAccent, width: 1.0),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
);
