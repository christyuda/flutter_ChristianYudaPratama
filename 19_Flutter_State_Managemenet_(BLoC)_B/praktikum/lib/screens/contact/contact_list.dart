import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/contact_bloc.dart';
import 'package:test_bloc/bloc/contact_event.dart';
import 'package:test_bloc/bloc/contact_state.dart';
import 'package:test_bloc/models/contact.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        if (state is ContactLoadedState) {
          final contacts = state.contacts;

          return Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      final contact = contacts[index];
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
                                _editContact(context, index, contact);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _deleteContact(context, index, contact);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  void _editContact(BuildContext context, int index, Contact contact) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: contact.name),
                onChanged: (value) {
                  // Update data kontak saat input berubah
                  contact.name = value;
                },
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk menyimpan perubahan kontak
                BlocProvider.of<ContactBloc>(context).add(
                  EditContactEvent(index, contact), // Perbaiki indeks di sini
                );
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  void _deleteContact(BuildContext context, int index, Contact contact) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hapus Contact'),
          content: Text('Apakah Anda yakin ingin menghapus kontak ini?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk menghapus kontak
                BlocProvider.of<ContactBloc>(context).add(
                  DeleteContactEvent(index), // Perbaiki indeks di sini
                );
                Navigator.pop(context);
              },
              child: Text('Hapus'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }
}
