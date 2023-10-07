import 'package:flutter/material.dart';
import 'package:restandmvvm/models/contact.dart';
import 'package:restandmvvm/services/apiget_service.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late Future<Contact> contactFuture;

  final contactService = ContactService();

  @override
  void initState() {
    super.initState();
    contactFuture = contactService.fetchContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Detail'),
      ),
      body: FutureBuilder<Contact>(
        future: contactFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final contact = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ID: ${contact.id}'),
                  Text('Name: ${contact.name}'),
                  Text('Phone: ${contact.phone}'),
                ],
              ),
            );
          } else {
            return Center(child: Text('No Data'));
          }
        },
      ),
    );
  }
}
