import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todo/rules/constants.dart';
import 'package:todo/screens/task_screen.dart';
// import 'package:todo/screens/login_screen.dart';
import 'package:todo/theme/account_button.dart';
import 'package:todo/theme/gradient_button.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String repeatPassword;
  bool showSpinner = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        decoration: kTextFieldInputDecoration.copyWith(
                          labelText: 'Email',
                          icon: Icon(Icons.email),
                        ),
                        onChanged: (value) {
                          email = value;
                        },
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
                        decoration: kTextFieldInputDecoration.copyWith(
                            labelText: 'Password', icon: Icon(Icons.lock)),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      TextField(
                        obscureText: true,
                        controller: rePasswordController,
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w800,
                        ),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration: kTextFieldInputDecoration.copyWith(
                          labelText: 'Repeat Password',
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white70,
                          ),
                        ),
                        onChanged: (value) {
                          repeatPassword = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GradientButton(
                  color1: Color(0xFFfccb90),
                  color2: Color(0xFFd57eeb),
                  label: 'Register',
                  onTap: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      if (password == repeatPassword) {
                        final user = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskScreen(),
                            ),
                          );
                        }
                      } else {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: 'FAILED',
                          desc: 'Password not match',
                          buttons: [
                            DialogButton(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFfccb90),
                                  Color(0xFFd57eeb),
                                ],
                              ),
                              child: Text(
                                'cancel',
                                style: TextStyle(
                                    color: Colors.white60,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              width: 120.0,
                            ),
                          ],
                        ).show();
                      }

                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print('registration error $e');
                    }
                    emailController.clear();
                    passwordController.clear();
                    rePasswordController.clear();
                  },
                ),
              ),
              AccountButton(
                lable: 'Already have an account?',
                onTap: () {
                  //!this route use for tempo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskScreen(),
                    ),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => LoginScreen(),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
