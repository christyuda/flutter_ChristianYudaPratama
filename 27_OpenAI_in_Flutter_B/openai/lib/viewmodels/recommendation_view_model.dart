import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:openai/env/env.dart';

class RecommendationViewModel extends ChangeNotifier {
  final Dio _dio = Dio();

  String _responseText = "";
  bool _isLoading = false;
  String _errorText = "";

  String get responseText => _responseText;
  bool get isLoading => _isLoading;
  String get errorText => _errorText;

  Future<void> sendOpenAIRequest(
      double price, int cameraMP, int storageGB) async {
    try {
      _isLoading = true;
      _errorText = "";

      final apiUrl = 'https://api.openai.com/v1/completions';
      final requestBody = {
        "model": "text-davinci-003",
        "prompt":
            "You Are a Smartphone expert. Give me a Smartphone recommendations with budget equals IDR 15.000.000",
        "temperature": 0.4,
        "max_tokens": 64,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      };

      final response = await _dio.post(
        apiUrl,
        data: requestBody,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${Env.apiKey}',
          },
        ),
      );

      if (response.statusCode == 200) {
        _responseText = response.data['choices'][0]['text'];
      } else {
        _errorText = 'Gagal mengirim permintaan ke OpenAI';
      }
    } catch (e) {
      _errorText = 'Terjadi kesalahan: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
