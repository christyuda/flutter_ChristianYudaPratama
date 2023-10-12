import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_testing/bloc/contact_bloc.dart';
import 'package:ui_testing/models/contact.dart';

class ContactForm extends StatefulWidget {
  final GlobalKey<ContactFormState> formKey; // Gunakan GlobalKey

  ContactForm({required this.formKey});

  @override
  ContactFormState createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
            final name = nameController.text;
            final phone = phoneController.text;
            final contact = Contact(name, phone);
            context.read<ContactBloc>().addContact(contact);

            // Clear the form after adding a contact
            nameController.text = '';
            phoneController.text = '';
          },
          child: Text('Add Contact'),
        ),
      ],
    );
  }
}
