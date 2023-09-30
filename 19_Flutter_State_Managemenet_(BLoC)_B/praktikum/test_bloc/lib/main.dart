// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/contact_bloc.dart';
import 'package:test_bloc/bloc/contact_event.dart';
import 'package:test_bloc/bloc/contact_state.dart';
import 'package:test_bloc/models/contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ContactBloc(),
        child: ContactApp(),
      ),
    );
  }
}

class ContactApp extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ContactBloc contactBloc = BlocProvider.of<ContactBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Nomor Telepon'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                contactBloc.add(
                  AddContact(
                    name: nameController.text,
                    phone: phoneController.text,
                  ),
                );
                nameController.clear();
                phoneController.clear();
              },
              child: Text('Tambah Kontak'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: BlocBuilder<ContactBloc, ContactState>(
                builder: (context, state) {
                  if (state is ContactLoading) {
                    return CircularProgressIndicator();
                  } else if (state is ContactLoaded) {
                    final List<Contact> contacts = state.contacts;
                    return ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        final Contact contact = contacts[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            title: Text(contact.name),
                            subtitle: Text(contact.phone),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                contactBloc
                                    .add(DeleteContact(contactId: contact.id));
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is ContactError) {
                    return Text(state.message);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
