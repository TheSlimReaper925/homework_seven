import 'package:flutter/material.dart';
import 'package:homework_seven/data/logic/database_logic.dart';
import 'package:homework_seven/data/models/students.dart';
import 'package:homework_seven/presentations/screens/add_student_screen.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students app"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DatabaseLogic().students(),
        builder: (context, snapshot) {
          List<Object> students = [];
          if (snapshot.hasData) {
            print(snapshot);
            students = <Object>[snapshot.data!];
          }
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final currentStudent = students[index];
              return Padding(
                padding: const EdgeInsets.all(15),
                child: ListTile(
                  key: UniqueKey(),
                  title: Text(currentStudent.toString()),
                ),
              );
            },
            itemCount: students.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () =>
            Navigator.pushNamed(context, AddStudentScreen.routeName)
                .then((_) => setState(() {})),
      ),
    );
  }
}
