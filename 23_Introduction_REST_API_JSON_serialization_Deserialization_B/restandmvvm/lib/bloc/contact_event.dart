import 'package:equatable/equatable.dart';
import 'package:restandmvvm/models/contact.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchContactEvent extends ContactEvent {
  final int contactId;

  FetchContactEvent(this.contactId);

  @override
  List<Object?> get props => [contactId];
}

abstract class ContactState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ContactInitialState extends ContactState {}

class ContactLoadingState extends ContactState {}

class ContactLoadedState extends ContactState {
  final Contact contact;

  ContactLoadedState(this.contact);

  @override
  List<Object?> get props => [contact];
}

class ContactErrorState extends ContactState {
  final String error;

  ContactErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
