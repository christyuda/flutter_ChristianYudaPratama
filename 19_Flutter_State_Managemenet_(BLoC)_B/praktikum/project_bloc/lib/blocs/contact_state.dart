// contact_state.dart

import 'package:equatable/equatable.dart';
import 'package:project_bloc/models/contact.dart';

abstract class ContactState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ContactsLoadingState extends ContactState {}

class ContactsLoadedState extends ContactState {
  final List<Contact> contacts;

  ContactsLoadedState(this.contacts);

  @override
  List<Object?> get props => [contacts];
}

class ContactsErrorState extends ContactState {
  final String error;

  ContactsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
