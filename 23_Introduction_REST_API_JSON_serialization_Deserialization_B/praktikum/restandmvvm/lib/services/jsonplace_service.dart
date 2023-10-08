import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<void> updatePost(int postId, Map<String, dynamic> postData) async {
    try {
      final response = await _dio.put(
        '$baseUrl/posts/$postId',
        data: postData,
      );

      if (response.statusCode == 200) {
        // Pembaruan berhasil
        return;
      } else {
        throw Exception('Failed to update post');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
