// lib/bloc/contact_bloc.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:test_bloc/models/contact.dart';
import 'package:test_bloc/bloc/contact_event.dart';
import 'package:test_bloc/bloc/contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()); // Tambahkan konstruktor nol argumen

  List<Contact> contacts = [];

  @override
  ContactState get initialState => ContactInitial();

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is AddContact) {
      contacts.add(Contact(
        id: DateTime.now().toString(),
        name: event.name,
        phone: event.phone,
      ));
      yield ContactLoaded(contacts: contacts);
    } else if (event is DeleteContact) {
      contacts.removeWhere((contact) => contact.id == event.contactId);
      yield ContactLoaded(contacts: contacts);
    }
  }
}
