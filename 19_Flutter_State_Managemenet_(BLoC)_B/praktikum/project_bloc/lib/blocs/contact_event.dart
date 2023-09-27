// contact_event.dart

import 'package:equatable/equatable.dart';
import 'package:project_bloc/models/contact.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddContactEvent extends ContactEvent {
  final Contact contact;

  AddContactEvent(this.contact);

  @override
  List<Object?> get props => [contact];
}

class DeleteContactEvent extends ContactEvent {
  final Contact contact;

  DeleteContactEvent(this.contact);

  @override
  List<Object?> get props => [contact];
}
