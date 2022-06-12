class LoginResponse {
  final String name;
  final String email;
  final int id;

  factory LoginResponse.fromJson(Map<String, dynamic> parsedJson) {
    return LoginResponse(
      parsedJson['name'],
      parsedJson['email'],
      parsedJson['id'],
    );
  }

  factory LoginResponse.fromError() {
    return const LoginResponse("Error", "Error", 0);
  }

  const LoginResponse(this.name, this.email, this.id);
}
