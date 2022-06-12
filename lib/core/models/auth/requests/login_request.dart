import 'dart:convert';

class LoginRequest {
  final String name;
  final String email;

  String serialize() {
    final body = jsonEncode({
      "name": name,
      "email": email,
    });

    return body;
  }

  const LoginRequest(this.name, this.email);
}
