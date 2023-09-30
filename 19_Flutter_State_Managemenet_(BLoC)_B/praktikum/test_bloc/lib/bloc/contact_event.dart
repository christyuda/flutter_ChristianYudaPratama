import 'package:test_bloc/models/contact.dart';

abstract class ContactEvent {}

class AddContactEvent extends ContactEvent {
  final Contact contact;

  AddContactEvent(this.contact);
}

class EditContactEvent extends ContactEvent {
  final int index;
  final Contact contact;

  EditContactEvent(this.index, this.contact);
}

class DeleteContactEvent extends ContactEvent {
  final int index;

  DeleteContactEvent(this.index);
}
