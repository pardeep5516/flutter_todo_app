import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:todo/rules/constants.dart';
import 'package:todo/screens/registration_screen.dart';
import 'package:todo/screens/task_screen.dart';
import 'package:todo/theme/account_button.dart';
import 'package:todo/theme/gradient_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orangeAccent, Colors.pinkAccent],
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Image(
                  image: AssetImage('assets/task2.png'),
                  width: 200.0,
                  height: 200.0,
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFd57eeb).withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32.0),
                      bottomLeft: Radius.circular(32.0),
                    ),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextField(
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w800,
                        ),
                        cursorColor: Colors.white,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: kTextFieldInputDecoration.copyWith(
                          labelText: 'Email',
                          icon: Icon(Icons.email),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w800,
                        ),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: kTextFieldInputDecoration.copyWith(
                            labelText: 'Password', icon: Icon(Icons.lock)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GradientButton(
                  color2: Color(0xFFfbc2eb),
                  color1: Color(0xFFa18cd1),
                  label: 'Log in',
                  onTap: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskScreen(),
                          ),
                        );
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print('login error$e');
                    }
                    emailController.clear();
                    passwordController.clear();
                  },
                ),
              ),
              AccountButton(
                lable: 'Dont\'t have an account? Create one!',
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
    );
  }
}
