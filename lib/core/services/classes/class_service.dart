import 'package:dio/dio.dart';
import 'package:easy_register/core/models/classes/request/create-class-request.dart';

import 'package:easy_register/core/models/common/class.dart';

import '../../models/common/evaluation.dart';
import '../../models/common/student.dart';
import '../../models/response_dto.dart';

class ClassService {
  final String baseUrl;

  const ClassService(this.baseUrl);

  //Function to get all classes
  //NEED: Test it out
  Future<ResponseDto<List<Class>>> getAllClasses() async {
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
      final List<Class> classResponse = Class.fromJsonList(data);
      return ResponseDto<List<Class>>(statusCode, classResponse, error);
    } catch (e) {
      final List<Class> classResponse = [Class.fromError()];
      return ResponseDto<List<Class>>(
          statusCode, classResponse, (e as DioError).error);
    }
  }

  Future<ResponseDto<bool>> createClass(String name, int teacherId,
      List<Evaluation> evaluations, int base, List<Student> students) async {
    bool isSuccesful = false;
    final String url = "$baseUrl/classes";
    final String body =
        CreateClassRequest(name, teacherId, evaluations, base, students)
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
      isSuccesful = true;
      return ResponseDto<bool>(statusCode, isSuccesful, error);
    } catch (e) {
      return ResponseDto<bool>(statusCode, isSuccesful, (e as DioError).error);
    }
  }
}
