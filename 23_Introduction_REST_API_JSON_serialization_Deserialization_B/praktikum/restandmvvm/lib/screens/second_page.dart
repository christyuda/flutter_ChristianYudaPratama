import 'package:flutter/material.dart';
import 'package:restandmvvm/models/contact.dart';
import 'package:restandmvvm/viewmodels/contact_viewmodel.dart';

class ContactView extends StatefulWidget {
  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final ContactViewModel _contactViewModel = ContactViewModel();
  late Future<Contact> _contactFuture;

  @override
  void initState() {
    super.initState();
    _contactFuture =
        _contactViewModel.fetchContact(2); // Ganti dengan ID kontak yang sesuai
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Contact>(
        future: _contactFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final contact = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(contact.avatar),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "${contact.firstName} ${contact.lastName}",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Email: ${contact.email}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "ID: ${contact.id}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _contactFuture = _contactViewModel
                .fetchContact(2); // Ganti dengan ID kontak yang sesuai
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
