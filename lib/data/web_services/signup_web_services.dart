// Packages
import 'package:dio/dio.dart';
import 'package:pharmalink/utilities/constants/apis.dart';
import 'package:pharmalink/utilities/constants/strings.dart';

class SignupWebServices {
  late Dio dio;

  SignupWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );

    dio = Dio(options);
  }

  Future<dynamic> signupPatient(Map body) async {
    try {
      Response response = await dio.post(API.patientSignUp,data: body);
      return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<dynamic> signupDoctor(Map body) async {
    try {
      Response response = await dio.post(API.patientSignUp,data: body);
      return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}
