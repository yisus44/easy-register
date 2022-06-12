import 'package:easy_register/core/models/common/teacher.dart';
import 'package:easy_register/core/models/common/user.dart';

class Class {
  final int id;
  final int teacherId;
  final String name;
  final Teacher teacher;

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

  Class(this.id, this.teacherId, this.name, this.teacher);
}
