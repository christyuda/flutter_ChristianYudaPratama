// lib/bloc/contact_state.dart
import 'package:equatable/equatable.dart';
import 'package:test_bloc/models/contact.dart';

abstract class ContactState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactLoaded extends ContactState {
  final List<Contact> contacts;

  ContactLoaded({required this.contacts});

  @override
  List<Object?> get props => [contacts];
}

class ContactError extends ContactState {
  final String message;

  ContactError({required this.message});

  @override
  List<Object?> get props => [message];
}
