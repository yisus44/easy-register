import 'package:dio/dio.dart';

import 'package:easy_register/core/models/auth/requests/login_request.dart';
import 'package:easy_register/core/models/auth/responses/login_response.dart';

import 'package:easy_register/core/models/auth/responses/register_response.dart';
import '../../models/auth/requests/register_request.dart';
import '../../models/response_dto.dart';

class AuthService {
  final String baseUrl;

  const AuthService(this.baseUrl);

  //Function to sign up
  Future<ResponseDto<RegisterResponse>> register(
    String name,
    String email,
    String password,
    int birthDay,
    int birthMonth,
    int birthYear,
  ) async {
    final String url = "$baseUrl/auth/register";
    final String body =
        RegisterRequest(name, password, email, birthDay, birthMonth, birthYear)
            .serialize();
    int statusCode = 500;
    try {
      Response response = await Dio().post(url, data: body);
      if (response.data == null) {
        throw Exception("Error reaching the server, please try again later");
      }

      final data = response.data["data"];
      statusCode = response.data["status"] as int;
      final error = response.data["error"];
      final RegisterResponse registerResponse = RegisterResponse.fromJson(data);

      return ResponseDto<RegisterResponse>(statusCode, registerResponse, error);
    } catch (e) {
      final RegisterResponse registerResponse = RegisterResponse.fromError();
      return ResponseDto<RegisterResponse>(
          statusCode, registerResponse, (e as DioError).error);
    }
  }

  //Function to sign in
  //NEED: test it out!
  Future<ResponseDto<LoginResponse>> login(
    String email,
    String password,
  ) async {
    final String url = "$baseUrl/auth/register";
    final String body = LoginRequest(email, password).serialize();
    int statusCode = 500;
    try {
      Response response = await Dio().post(url, data: body);
      if (response.data == null) {
        throw Exception("Error reaching the server, please try again later");
      }

      final data = response.data["data"];
      statusCode = response.data["status"] as int;
      final error = response.data["error"];
      final LoginResponse registerResponse = LoginResponse.fromJson(data);

      return ResponseDto<LoginResponse>(statusCode, registerResponse, error);
    } catch (e) {
      final LoginResponse registerResponse = LoginResponse.fromError();
      return ResponseDto<LoginResponse>(
          statusCode, registerResponse, (e as DioError).error);
    }
  }

  //Function to sign out
  //NEED: test it out!

  Future<bool> logout() async {
    final String url = "$baseUrl/auth/register";
    try {
      await Dio().post(url);
      return true;
    } catch (e) {
      return false;
    }
  }
}
