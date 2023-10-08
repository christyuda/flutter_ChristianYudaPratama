import 'package:flutter/foundation.dart';
import 'package:restandmvvm/models/contact.dart';
import 'package:restandmvvm/bloc/contact_bloc.dart';

class ContactViewModel extends ChangeNotifier {
  final ContactBloc _contactBloc = ContactBloc();

  Future<Contact> fetchContact(int contactId) async {
    try {
      final contact = await _contactBloc.fetchContact(contactId);
      return contact;
    } catch (e) {
      throw Exception('Failed to fetch contact: $e');
    }
  }
}
