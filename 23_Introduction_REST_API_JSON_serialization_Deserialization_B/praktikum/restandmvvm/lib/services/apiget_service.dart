import 'package:dio/dio.dart';
import 'package:restandmvvm/models/contact.dart';

class ContactService {
  final Dio dio = Dio();

  Future<Contact> fetchContact() async {
    final response = await dio.get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2');
    if (response.statusCode == 200) {
      return Contact.fromJson(response.data);
    } else {
      throw Exception('Failed to load contact');
    }
  }
}
