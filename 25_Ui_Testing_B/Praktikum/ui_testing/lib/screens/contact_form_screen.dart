// contact_form_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_testing/blocs/contact_form/contact_form_bloc.dart';
import 'package:ui_testing/blocs/contact_list/contact_list_bloc.dart';
import 'package:ui_testing/blocs/contact_form/contact_form_event.dart';
import 'package:ui_testing/blocs/contact_form/contact_form_state.dart';
import 'package:ui_testing/models/contact.dart';
import 'package:ui_testing/screens/contact_list_screen.dart';

class ContactFormScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ContactFormBloc contactFormBloc;
  final ContactListBloc contactListBloc;

  ContactFormScreen({
    required this.contactFormBloc,
    required this.contactListBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactFormBloc, ContactFormState>(
      bloc: contactFormBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Contact Form'),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Nomor Telepon'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (state is ContactFormEditing) {
                      // Add your logic for editing contact here
                    } else {
                      final newContact = Contact(
                        _nameController.text.trim(),
                        _phoneController.text,
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ContactListScreen(
                              contactListBloc: contactListBloc,
                            );
                          },
                        ),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
