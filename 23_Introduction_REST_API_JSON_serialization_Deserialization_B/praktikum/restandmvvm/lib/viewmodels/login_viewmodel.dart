import 'package:flutter/material.dart';
import 'package:restandmvvm/models/login_model.dart';
import 'package:restandmvvm/services/api_services.dart';

class LoginViewModel with ChangeNotifier {
  final ApiService apiService = ApiService();

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String email, String password) async {
    try {
      final loginModel = LoginModel(email: email, password: password);
      final response = await apiService.postLogin(loginModel);

      if (response != null) {
        if (response.statusCode == 200) {
          final data = response.data as Map<String, dynamic>;
          final token = data['token'] as String;

          _isLoggedIn = true;

          notifyListeners();
        } else {
          _isLoggedIn = false;

          notifyListeners();
        }
      } else {
        _isLoggedIn = false;

        notifyListeners();
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }
}
