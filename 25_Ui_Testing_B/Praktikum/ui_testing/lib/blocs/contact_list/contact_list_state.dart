import 'package:ui_testing/models/contact.dart';

abstract class ContactListState {}

class ContactListInitial extends ContactListState {}

class ContactsLoaded extends ContactListState {
  final List<Contact> contacts;
  ContactsLoaded(this.contacts);
}
