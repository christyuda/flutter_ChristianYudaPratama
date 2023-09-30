import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/models/contact.dart';
import 'package:test_bloc/bloc/contact_event.dart';
import 'package:test_bloc/bloc/contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  List<Contact> contacts = [];

  ContactBloc() : super(ContactInitialState());

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is AddContactEvent) {
      // Lakukan logika penambahan kontak di sini.
      contacts.add(event.contact);
      yield ContactLoadedState(List.from(contacts));
    } else if (event is EditContactEvent) {
      // Lakukan logika pengeditan kontak di sini.
      contacts[event.index] = event.contact;
      yield ContactLoadedState(List.from(contacts));
    } else if (event is DeleteContactEvent) {
      // Lakukan logika penghapusan kontak di sini.
      contacts.removeAt(event.index);
      yield ContactLoadedState(List.from(contacts));
    }
  }
}
