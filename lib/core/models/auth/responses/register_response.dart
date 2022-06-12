class RegisterResponse {
  final String name;
  final String email;
  final int id;

  factory RegisterResponse.fromJson(Map<String, dynamic> parsedJson) {
    return RegisterResponse(
      parsedJson['name'],
      parsedJson['email'],
      parsedJson['id'],
    );
  }

  factory RegisterResponse.fromError() {
    return const RegisterResponse("Error", "Error", 0);
  }

  const RegisterResponse(this.name, this.email, this.id);
}
