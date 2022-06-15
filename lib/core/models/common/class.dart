import 'package:easy_register/core/models/common/evaluation.dart';
import 'package:easy_register/core/models/common/student.dart';
import 'package:easy_register/core/models/common/teacher.dart';
import 'package:easy_register/core/models/common/user.dart';

class Class {
  final int id;
  final int teacherId;
  final String name;
  final Teacher? teacher;
  List<Evaluation>? evaluations;
  List<Student>? students;

  static List<Class> fromJsonList(List<dynamic> parsedJson) {
    List<Class> classes = parsedJson.map((classSchool) {
      final teacher = classSchool['teacher'];
      final user = teacher["user"];
      return Class(
        classSchool['id'],
        classSchool['teacher_id'],
        classSchool['name'],
        Teacher(
            teacher['id'],
            teacher['user_id'],
            DateTime.parse(teacher['birth_date']),
            User(user["name"], user["email"], user["id"])),
      );
    }).toList();
    return classes;
  }

  factory Class.fromError() {
    return Class(0, 0, "error",
        Teacher(0, 0, DateTime.now(), const User("error", "error", 0)));
  }

  factory Class.fromJson(dynamic parsedJson) {
    //FIX LATER
    final List<Evaluation> evaluations =
        parsedJson["evaluations"].map((evaluation) {
      return Evaluation(evaluation["name"], evaluation["value"]);
    });

    return Class(parsedJson["id"], parsedJson["teacher_id"], parsedJson["name"],
        parsedJson["base"]);
  }

  Class(this.id, this.teacherId, this.name, this.teacher,
      {this.evaluations, this.students});
}
