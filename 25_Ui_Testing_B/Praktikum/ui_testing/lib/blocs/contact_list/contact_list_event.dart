import 'package:equatable/equatable.dart';
import 'package:ui_testing/models/contact.dart';

abstract class ContactListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadContacts extends ContactListEvent {}

class AddContact extends ContactListEvent {
  final Contact newContact;

  AddContact(this.newContact);

  @override
  List<Object?> get props => [newContact];
}

class DeleteContact extends ContactListEvent {
  final int index;
  DeleteContact(this.index);
  @override
  List<Object?> get props => [index];
}
