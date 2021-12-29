import 'package:flutter/material.dart';
import 'package:homework_seven/data/logic/database_logic.dart';
import 'package:homework_seven/data/models/students.dart';

class AddStudentScreen extends StatelessWidget {
  AddStudentScreen({Key? key}) : super(key: key);
  static const routeName = "/wonder-detail";

  final _formkey = GlobalKey<FormState>();

  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Card(
                child: TextFormField(
                  controller: id,
                  decoration:
                      const InputDecoration(hintText: "Enter Student ID"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter valid ID";
                    }
                    return null;
                  },
                ),
              ),
              Card(
                child: TextFormField(
                  controller: name,
                  decoration:
                      const InputDecoration(hintText: "Enter student name"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter valid name";
                    }
                    return null;
                  },
                ),
              ),
              Card(
                child: TextFormField(
                  controller: age,
                  decoration:
                      const InputDecoration(hintText: "Enter student age"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter valid age";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Student student = Student(
                            id: int.parse(id.text),
                            name: name.text,
                            age: int.parse(age.text),
                          );
                          DatabaseLogic().insertStudent(student);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('done')),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("submit"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('back'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
