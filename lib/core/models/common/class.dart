import 'package:easy_register/core/models/common/teacher.dart';
import 'package:easy_register/core/models/common/user.dart';

class Class {
  final int id;
  final int teacherId;
  final String name;
  final Teacher teacher;

  factory Class.fromJson(Map<String, dynamic> parsedJson) {
    return Class(
      parsedJson['id'],
      parsedJson['teacherId'],
      parsedJson['name'],
      parsedJson['teacher'],
    );
  }

  factory Class.fromError() {
    return Class(0, 0, "error",
        Teacher(0, 0, DateTime.now(), const User("error", "error", 0)));
  }

  Class(this.id, this.teacherId, this.name, this.teacher);
}
