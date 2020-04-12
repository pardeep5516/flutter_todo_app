import 'package:flutter/material.dart';
import 'package:todo/screens/login_screen.dart';
import 'package:todo/screens/registration_screen.dart';
import 'package:todo/theme/gradient_button.dart';

class WelcomScreen extends StatefulWidget {
  @override
  _WelcomScreenState createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  Color color = Colors.orangeAccent;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.orangeAccent, Colors.pinkAccent],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'todo',
                child: Image(
                  image: AssetImage(
                    'assets/task4.png',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFEFA8E4).withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      bottomRight: Radius.circular(32.0),
                    ),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Register to save your progress',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      GradientButton(
                        color2: Color(0xFFfbc2eb),
                        color1: Color(0xFFa18cd1),
                        label: 'Log in',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                      GradientButton(
                        color1: Color(0xFFfccb90),
                        color2: Color(0xFFd57eeb),
                        label: 'Register',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
