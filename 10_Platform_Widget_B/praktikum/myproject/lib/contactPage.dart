import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'contact.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Contact> contacts = [
      Contact(name: 'Christian Yuda Pratama', phoneNumber: '123-456-7890'),
      Contact(name: 'Alice Johnson', phoneNumber: '987-654-3210'),
    ];

    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        final firstName = contact.name.split(' ')[0];
        final icon = firstName.isNotEmpty ? firstName[0] : '?';

        return ListTile(
          leading: CircleAvatar(
            child: Text(icon),
          ),
          title: Text(contact.name),
          subtitle: Text(contact.phoneNumber),
        );
      },
    );
  }
}
