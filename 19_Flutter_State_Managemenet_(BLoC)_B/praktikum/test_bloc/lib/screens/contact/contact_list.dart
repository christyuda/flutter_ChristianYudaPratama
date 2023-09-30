import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/contact_bloc.dart';
import 'package:test_bloc/bloc/contact_event.dart';
import 'package:test_bloc/bloc/contact_state.dart';
import 'package:test_bloc/models/contact.dart';
import 'package:test_bloc/screens/contact/edit_contact_page.dart'; // Sesuaikan dengan lokasi ContactEvent

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ContactBloc _contactBloc = BlocProvider.of<ContactBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactInitialState) {
            return CircularProgressIndicator();
          } else if (state is ContactLoadedState) {
            final List<Contact> contacts = state.contacts;

            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final Contact contact = contacts[index];

                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(contact.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Phone: ${contact.phone}'),
                      Text('Date: ${contact.date}'),
                      Text('File: ${contact.fileName}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _editContact(context, _contactBloc, contact, index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deleteContact(context, _contactBloc, contact);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  void _editContact(BuildContext context, ContactBloc contactBloc,
      Contact contact, int index) {
    // Navigasi ke halaman pengeditan kontak dengan membawa data kontak
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditContactPage(contact: contact, index: index),
      ),
    );
  }

  void _deleteContact(
      BuildContext context, ContactBloc contactBloc, Contact contact) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Contact'),
          content: Text('Apakah Anda yakin ingin menghapus kontak ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Hapus kontak dari daftar menggunakan contactBloc
                contactBloc.add(DeleteContactEvent(contact as int));
                Navigator.of(context).pop();
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }
}
