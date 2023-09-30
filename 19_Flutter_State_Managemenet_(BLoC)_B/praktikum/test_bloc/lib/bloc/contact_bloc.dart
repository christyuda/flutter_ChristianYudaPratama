import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/contact_event.dart';
import 'package:test_bloc/bloc/contact_state.dart';
import 'package:test_bloc/models/contact.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  List<Contact> contacts = [];

  ContactBloc() : super(ContactInitialState()) {
    on<AddContactEvent>((event, emit) {
      contacts.add(event.contact);
      emit(ContactLoadedState(List.from(contacts)));
    });

    on<EditContactEvent>((event, emit) {
      contacts[event.index] = event.contact;
      emit(ContactLoadedState(List.from(contacts)));
    });

    on<DeleteContactEvent>((event, emit) {
      contacts.removeAt(event.index);
      emit(ContactLoadedState(List.from(contacts)));
    });
  }

  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is AddContactEvent) {
      contacts.add(event.contact);
      yield ContactLoadedState(List.from(contacts));
    } else if (event is EditContactEvent) {
      contacts[event.index] = event.contact;
      yield ContactLoadedState(List.from(contacts));
    } else if (event is DeleteContactEvent) {
      contacts.removeAt(event.index);
      yield ContactLoadedState(List.from(contacts));
    }
  }
}
