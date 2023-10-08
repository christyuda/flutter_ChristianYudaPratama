import 'package:dio/dio.dart';
import 'package:restandmvvm/models/login_model.dart';

class ApiService {
  final Dio dio = Dio();
  final String baseUrl = 'https://reqres.in/api';

  Future<Response> postLogin(LoginModel loginModel) async {
    try {
      final response = await dio.post(
        '$baseUrl/login',
        data: loginModel.toJson(),
      );

      return response;
    } catch (e) {
      throw e;
    }
  }
}
