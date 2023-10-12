import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_testing/bloc/contact_bloc.dart';
import 'package:ui_testing/models/contact.dart';
import 'contact_form.dart'; // Import ContactForm

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final GlobalKey<ContactFormState> _formKey = GlobalKey(); // Buat GlobalKey

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: Column(
        children: <Widget>[
          ContactForm(formKey: _formKey), // Gunakan ContactForm dengan formKey
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
                              _formKey.currentState!.nameController.text =
                                  state[index].name;
                              _formKey.currentState!.phoneController.text =
                                  state[index].phoneNumber;
                              // Handle edit action here, if needed
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
