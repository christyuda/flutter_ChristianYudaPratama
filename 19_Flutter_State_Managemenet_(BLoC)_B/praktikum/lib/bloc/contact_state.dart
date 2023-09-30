import 'package:test_bloc/models/contact.dart';

abstract class ContactState {}

class ContactInitialState extends ContactState {}

class ContactLoadedState extends ContactState {
  final List<Contact> contacts;
  ContactLoadedState(this.contacts);
}
