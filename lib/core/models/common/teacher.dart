import 'package:easy_register/core/models/common/user.dart';

class Teacher {
  final int id;
  final int userId;
  final DateTime birthDate;
  final User user;
  const Teacher(this.id, this.userId, this.birthDate, this.user);
}
