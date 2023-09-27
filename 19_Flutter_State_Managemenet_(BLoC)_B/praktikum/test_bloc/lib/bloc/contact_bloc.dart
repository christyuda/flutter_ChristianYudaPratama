import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/main.dart';

abstract class ContactEvent {}

class AddContactEvent extends ContactEvent {
  final Contact contact;

  AddContactEvent(this.contact);
}

class EditContactEvent extends ContactEvent {
  final int index;
  final Contact contact;

  EditContactEvent(this.index, this.contact);
}

class DeleteContactEvent extends ContactEvent {
  final int index;

  DeleteContactEvent(this.index);
}

abstract class ContactState {}

class ContactInitialState extends ContactState {}

class ContactLoadedState extends ContactState {
  final List<Contact> contacts;

  ContactLoadedState(this.contacts);
}

class ContactErrorState extends ContactState {
  final String errorMessage;

  ContactErrorState(this.errorMessage);
}

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

  @override
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
