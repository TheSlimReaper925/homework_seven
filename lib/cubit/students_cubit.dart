import 'package:bloc/bloc.dart';
import 'package:homework_seven/data/models/students.dart';

class StudentsCubit extends Cubit<String> {
  StudentsCubit(String initialState) : super('');

  void addStudent(Student student) => emit(student.toString());
}
