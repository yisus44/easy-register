import 'dart:convert';

class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final int birthDay;
  final int birthYear;
  final int birthMonth;

  String serialize() {
    //date format:year-month-day
    final String birthDate = "$birthYear-$birthMonth-$birthDay";
    //response = await dio.post('/test', data: {'id': 12, 'name': 'wendu'});
    final body = jsonEncode({
      "name": name,
      "email": email,
      "password": password,
      "birth_date": birthDate,
    });

    return body;
  }

  const RegisterRequest(this.name, this.email, this.password, this.birthDay,
      this.birthMonth, this.birthYear);
}
