import 'package:ui_testing/models/contact.dart';

abstract class ContactFormEvent {}

class SubmitContact extends ContactFormEvent {
  final Contact contact;

  SubmitContact(this.contact);
}

class EditContact extends ContactFormEvent {
  final Contact contact;
  EditContact(this.contact);
}
