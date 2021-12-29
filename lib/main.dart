import 'package:flutter/material.dart';
import 'package:homework_seven/data/logic/database_logic.dart';
import 'package:homework_seven/data/models/students.dart';
import 'package:homework_seven/presentations/screens/add_student_screen.dart';
import 'presentations/screens/home_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AddStudentScreen.routeName: (context) => AddStudentScreen(),
      },
      home: HomeScreen(),
    );
  }
}
