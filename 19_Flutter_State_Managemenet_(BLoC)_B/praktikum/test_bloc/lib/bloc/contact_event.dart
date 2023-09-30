// lib/bloc/contact_event.dart
import 'package:equatable/equatable.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddContact extends ContactEvent {
  final String name;
  final String phone;

  AddContact({required this.name, required this.phone});

  @override
  List<Object?> get props => [name, phone];
}

class DeleteContact extends ContactEvent {
  final String contactId;

  DeleteContact({required this.contactId});

  @override
  List<Object?> get props => [contactId];
}
