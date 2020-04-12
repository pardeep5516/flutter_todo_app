import 'package:flutter/material.dart';
import 'package:todo/rules/constants.dart';
import 'package:todo/theme/gradient_button.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orangeAccent, Colors.pinkAccent],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Image(
                image: AssetImage('assets/task2.png'),
                width: 170.0,
                height: 170.0,
              ),
            ),
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              obscureText: true,
              controller: textController,
              style: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.w800,
              ),
              cursorColor: Colors.white,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {},
              decoration: kTextFieldInputDecoration.copyWith(
                  labelText: 'Task',
                  labelStyle: (TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white60,
                  ))),
            ),
            SizedBox(
              height: 20.0,
            ),
            GradientButton(
              color1: Color(0xFFEA6227),
              color2: Color(0xFFEFA8E4),
              label: 'Start',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
