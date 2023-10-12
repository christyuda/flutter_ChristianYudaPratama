import 'package:flutter_test/flutter_test.dart';
import 'package:ui_testing/bloc/contact_bloc.dart';
import 'package:ui_testing/models/contact.dart';

void main() {
  group('ContactBloc', () {
    test('Initial state should be empty', () {
      final bloc = ContactBloc();
      expect(bloc.state, isEmpty);
    });

    test('Adding contact should update state', () {
      final bloc = ContactBloc();
      final contact = Contact('John Doe', '1234567890');
      bloc.addContact(contact);
      expect(bloc.state, [contact]);
    });

    test('Updating contact should update state', () {
      final bloc = ContactBloc();
      final contact = Contact('John Doe', '1234567890');
      bloc.addContact(contact);
      final updatedContact = Contact('Jane Doe', '9876543210');
      bloc.updateContact(0, updatedContact);
      expect(bloc.state, [updatedContact]);
    });

    test('Deleting contact should update state', () {
      final bloc = ContactBloc();
      final contact = Contact('John Doe', '1234567890');
      bloc.addContact(contact);
      bloc.deleteContact(0);
      expect(bloc.state, isEmpty);
    });
  });
}
