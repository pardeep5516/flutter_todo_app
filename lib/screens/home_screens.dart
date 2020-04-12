import 'package:flutter/material.dart';
import 'package:todo/rules/constants.dart';
import 'package:todo/screens/welcome_screen.dart';
import 'package:todo/theme/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.orangeAccent, Colors.pinkAccent],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Hero(
                tag: 'todo',
                child: Image(
                  image: AssetImage('assets/task5.png'),
                ),
              ),
            ),
            GradientButton(
              color1: Color(0xFFEA6227),
              color2: Color(0xFFEFA8E4),
              label: 'Start',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 22.0,
            ),
            Text(
              'created by pradeep yadav.',
              style: kAuthorNameStyle,
            ),
          ],
        ),
      ),
    );
  }
}
