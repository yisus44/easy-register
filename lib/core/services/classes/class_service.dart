import 'package:dio/dio.dart';

import 'package:easy_register/core/models/auth/responses/register_response.dart';
import 'package:easy_register/core/models/common/class.dart';

import '../../models/response_dto.dart';

class AuthService {
  final String baseUrl;

  const AuthService(this.baseUrl);

  //Function to get all classes
  //NEED: Test it out
  Future<ResponseDto<Class>> getAllClasses() async {
    final String url = "$baseUrl/classes";

    int statusCode = 500;
    try {
      Response response = await Dio().get(url);
      if (response.data == null) {
        throw Exception("Error reaching the server, please try again later");
      }

      final data = response.data["data"];
      statusCode = response.data["status"] as int;
      final error = response.data["error"];
      final Class classResponse = Class.fromJson(data);

      return ResponseDto<Class>(statusCode, classResponse, error);
    } catch (e) {
      final Class classResponse = Class.fromError();
      return ResponseDto<Class>(
          statusCode, classResponse, (e as DioError).error);
    }
  }
}
