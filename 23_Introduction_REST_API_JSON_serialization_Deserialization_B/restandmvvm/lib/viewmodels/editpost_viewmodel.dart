import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class EditPostViewModel extends ChangeNotifier {
  final Dio _dio = Dio();
  late String _title = ""; // Inisialisasi variabel _title
  late String _body = ""; // Inisialisasi variabel _body

  String get title => _title;
  String get body => _body;

  Future<void> updatePost(String newTitle, String newBody) async {
    try {
      final response = await _dio.put(
        'https://jsonplaceholder.typicode.com/posts/1',
        data: {
          'id': 1,
          'title': newTitle,
          'body': newBody,
          'userId': 1,
        },
      );

      if (response.statusCode == 200) {
        _title = newTitle;
        _body = newBody;
        notifyListeners();
      } else {
        throw Exception('Failed to update post');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
