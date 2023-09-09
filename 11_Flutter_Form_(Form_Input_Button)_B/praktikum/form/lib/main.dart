import 'package:flutter/material.dart';
import 'contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Contact {
  String name;
  String phone;

  Contact(this.name, this.phone);
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  List<Contact> contacts = [];
  int editingIndex = -1;

  void _addContact() {
    final name = _nameController.text;
    final phone = _phoneController.text;
    final newContact = Contact(name, phone);
    // Validasi Nama
    if (name.isEmpty) {
      _showErrorDialog('Nama harus diisi.');
      return;
    }
    final nameParts = name.split(' ');
    if (nameParts.length < 2 ||
        !nameParts.every((part) => part[0].toUpperCase() == part[0]) ||
        name.contains(RegExp(r'[0-9\W]'))) {
      _showErrorDialog(
          'Nama harus terdiri dari minimal 2 kata, setiap kata harus dimulai dengan huruf kapital, dan tidak boleh mengandung angka atau karakter khusus.');
      return;
    }

// Validasi Nomor Telepon
    if (phone.isEmpty) {
      _showErrorDialog('Nomor telepon harus diisi.');
      return;
    }

    if (!phone.startsWith('0') ||
        !phone.substring(1).contains(RegExp(r'^[0-9]+$')) ||
        phone.length < 8 ||
        phone.length > 15) {
      _showErrorDialog(
          'Nomor telepon harus dimulai dengan angka 0, terdiri dari angka saja, dan memiliki panjang minimal 8 digit dan maksimal 15 digit.');
      return;
    }
    if (editingIndex == -1) {
      // Jika tidak dalam mode pengeditan, tambahkan kontak baru
      final newContact = Contact(name, phone);
      setState(() {
        contacts.add(newContact);
        _nameController.clear();
        _phoneController.clear();
      });
    } else {
      // Jika dalam mode pengeditan, perbarui kontak yang ada
      setState(() {
        contacts[editingIndex].name = name;
        contacts[editingIndex].phone = phone;
        editingIndex = -1; // Keluar dari mode pengeditan setelah pembaruan
        _nameController.clear();
        _phoneController.clear();
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void _editContact(int index) {
    setState(() {
      final contact = contacts[index];
      _nameController.text = contact.name;
      _phoneController.text = contact.phone;
      editingIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Deskripsi'),
                    content: Text('Ini adalah aplikasi Kontak Flutter.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Tutup'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Create New Contact',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Deskripsi: Ini adalah aplikasi Kontak Flutter.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: 'Nama', hintText: 'Masukkan nama kontak'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                  labelText: 'Nomor Telepon', hintText: 'Masukkan no telepon'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: _addContact,
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                    child: Text(
                      editingIndex == -1 ? 'Submit' : 'Update',
                      style: TextStyle(fontSize: 14),
                    ))
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'List Contacts',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(contacts[index].name),
                    subtitle: Text(contacts[index].phone),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editContact(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteContact(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
