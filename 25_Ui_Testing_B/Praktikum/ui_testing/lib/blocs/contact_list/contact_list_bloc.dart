import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_testing/blocs/contact_list/contact_list_event.dart';
import 'package:ui_testing/blocs/contact_list/contact_list_state.dart';
import 'package:ui_testing/models/contact.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  ContactListBloc() : super(ContactListInitial());
  List<Contact> _contacts = [];

  @override
  Stream<ContactListState> mapEventToState(ContactListEvent event) async* {
    if (event is LoadContacts) {
      yield ContactsLoaded(_contacts);
    } else if (event is DeleteContact) {
      _contacts.removeAt(event.index);
      yield ContactsLoaded(_contacts);
    }
  }
}
