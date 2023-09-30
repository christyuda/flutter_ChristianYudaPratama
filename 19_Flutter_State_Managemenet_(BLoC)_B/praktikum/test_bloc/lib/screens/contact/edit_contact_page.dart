import 'package:flutter/material.dart';
import 'package:test_bloc/models/contact.dart';

class EditContactPage extends StatelessWidget {
  final Contact contact;
  final int index;

  EditContactPage({required this.contact, required this.index});

  @override
  Widget build(BuildContext context) {
    // Implementasi tampilan pengeditan kontak di sini
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Contact'),
      ),
      body: Center(
        child: Text('Halaman Edit Kontak'),
      ),
    );
  }
}
