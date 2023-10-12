import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_testing/models/contact.dart';

class ContactBloc extends Cubit<List<Contact>> {
  ContactBloc() : super([]);

  void addContact(Contact contact) {
    state.add(contact);
    emit(List.from(state));
  }

  void updateContact(int index, Contact updatedContact) {
    state[index] = updatedContact;
    emit(List.from(state));
  }

  void deleteContact(int index) {
    state.removeAt(index);
    emit(List.from(state));
  }
}
