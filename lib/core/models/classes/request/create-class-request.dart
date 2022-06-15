import 'dart:convert';

import 'package:easy_register/core/models/common/evaluation.dart';

import '../../common/student.dart';

class CreateClassRequest {
  final String name;
  final int teacherId;
  final List<Evaluation> evaluations;
  final int base;
  final List<Student>? students;

  CreateClassRequest(
      this.name, this.teacherId, this.evaluations, this.base, this.students);

  String serialize() {
    String evaluationsSerialized = "[";
    int counter = 0;
    evaluations.forEach((element) {
      evaluationsSerialized += jsonEncode({
        "name": element.name,
        "value": element.value,
      });

      if (evaluations.length - 1 != counter) {
        evaluationsSerialized += ",";
      }

      counter++;
    });
    evaluationsSerialized += "]";
    final body = jsonEncode({
      "name": name,
      "teacher_id": teacherId,
      "evaluations": evaluationsSerialized,
      "base": base,
    });

    return body;
  }
}
