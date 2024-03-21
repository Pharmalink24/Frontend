// Packages
import 'package:dio/dio.dart';
import 'package:pharmalink/utilities/constants/apis.dart';
import 'package:pharmalink/utilities/constants/strings.dart';

class HomeWebServices {
  late Dio dio;

  HomeWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );

    dio = Dio(options);
  }

  Future<dynamic> getPatientInfoHome() async {
    try {
      Response response = await dio.get(API.patientSignUp);
      return response.data;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
