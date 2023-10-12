import 'package:ui_testing/models/contact.dart';

abstract class ContactFormState {}

class ContactFormInitial extends ContactFormState {}

class ContactFormEditing extends ContactFormState {
  final Contact contact;
  ContactFormEditing(this.contact);
}
