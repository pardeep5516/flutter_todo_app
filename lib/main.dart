import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/screens/home_screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'todo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
      ),
      home: HomeScreen(),
    );
  }
}
