// contact_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_testing/blocs/contact_list/contact_list_bloc.dart';
import 'package:ui_testing/blocs/contact_list/contact_list_event.dart';
import 'package:ui_testing/blocs/contact_list/contact_list_state.dart';

class ContactListScreen extends StatelessWidget {
  final ContactListBloc contactListBloc;

  ContactListScreen({required this.contactListBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactListBloc, ContactListState>(
      bloc: contactListBloc,
      builder: (context, state) {
        if (state is ContactsLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Contact List'),
            ),
            body: ListView.builder(itemBuilder: (context, index) {
              final contact = state.contacts[index];
              return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.phone),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    contactListBloc.add(DeleteContact(index));
                  },
                ),
              );
            }),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Contact List'),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
