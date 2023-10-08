import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:restandmvvm/bloc/contact_event.dart';
import 'package:restandmvvm/models/contact.dart';

class ContactBloc extends BlocBase {
  final Dio _dio = Dio();

  ContactBloc()
      : super(
            ContactInitialState()); // Gantilah InitialState() sesuai dengan state awal yang Anda gunakan.

  Future<Contact> fetchContact(int contactId) async {
    try {
      final response = await _dio.get('https://reqres.in/api/users/$contactId');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = response.data['data'];
        return Contact.fromJson(jsonData);
      } else {
        throw Exception('Failed to load contact');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  @override
  void dispose() {
    super.close();
  }
}
