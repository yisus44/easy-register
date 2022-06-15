import 'dart:convert';

class LoginRequest {
  final String password;
  final String email;

  String serialize() {
    final body = jsonEncode({
      "password": password,
      "email": email,
    });

    return body;
  }

  const LoginRequest(this.password, this.email);
}
