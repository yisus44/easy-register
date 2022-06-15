import 'dart:convert';

class Evaluation {
  final String name;
  final double value;

  Evaluation(this.name, this.value);

  String serialize() {
    final body = jsonEncode({
      "name": name,
      "base": value,
    });

    return body;
  }

  factory Evaluation.fromJson(Map<String, dynamic> parsedJson) {
    return Evaluation(
      parsedJson['name'],
      parsedJson['value'],
    );
  }

  factory Evaluation.fromError() {
    return Evaluation("Error", 0);
  }
}
