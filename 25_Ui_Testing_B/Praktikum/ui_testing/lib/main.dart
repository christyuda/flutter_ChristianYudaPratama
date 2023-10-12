import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_testing/bloc/contact_bloc.dart';
import 'package:ui_testing/models/contact.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final contactBloc = ContactBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact CRUD',
      home: BlocProvider(
        create: (context) => contactBloc,
        child: ContactList(),
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int? editingIndex; // Deklarasi editingIndex

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (editingIndex == null) {
                final name = nameController.text;
                final phone = phoneController.text;
                final contact = Contact(name, phone);
                context.read<ContactBloc>().addContact(contact);
              } else {
                // Mengedit kontak yang ada pada indeks yang sedang diedit
                final updatedName = nameController.text;
                final updatedPhone = phoneController.text;
                final updatedContact = Contact(updatedName, updatedPhone);
                context
                    .read<ContactBloc>()
                    .updateContact(editingIndex!, updatedContact);
                editingIndex = null; // Reset indeks yang sedang diedit
              }

              nameController.text = '';
              phoneController.text = '';
            },
            child: Text(editingIndex == null ? 'Add Contact' : 'Save Contact'),
          ),
          Expanded(
            child: BlocBuilder<ContactBloc, List<Contact>>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state[index].name),
                      subtitle: Text(state[index].phoneNumber),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              nameController.text = state[index].name;
                              phoneController.text = state[index].phoneNumber;
                              editingIndex = index;
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              context.read<ContactBloc>().deleteContact(index);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
