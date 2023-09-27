import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:project_bloc/models/contact.dart';
import './contact_event.dart';
import './contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  List<Contact> contacts = [];

  ContactBloc() : super(ContactsLoadingState()); // Perbaiki konstruktor

  @override
  Stream<ContactState> mapEventToState(
    ContactEvent event,
  ) async* {
    if (event is AddContactEvent) {
      contacts.add(event.contact);
      yield ContactsLoadedState(List.from(contacts));
    } else if (event is DeleteContactEvent) {
      contacts.remove(event.contact);
      yield ContactsLoadedState(List.from(contacts));
    }
  }
}
