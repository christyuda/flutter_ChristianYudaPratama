import 'package:flutter/material.dart';
import 'contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contacts = [];

  void addContact(Contact contact) {
    contacts.add(contact);
    notifyListeners();
  }

  void updateContact(int index, Contact contact) {
    contacts[index] = contact;
    notifyListeners();
  }

  void deleteContact(int index) {
    contacts.removeAt(index);
    notifyListeners();
  }
}
