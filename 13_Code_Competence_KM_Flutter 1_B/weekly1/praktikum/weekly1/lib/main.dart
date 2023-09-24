import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void _showAlertDialog(BuildContext context) {
    String username = usernameController.text;
    String email = emailController.text;
    String message = messageController.text;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Data yang Anda masukkan:'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Username: $username'),
              Text('Email: $email'),
              Text('Message: $message'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nama Aplikasi Anda'),
        // Logo aplikasi dapat ditambahkan di sini
      ),
      body: ListView(
        children: <Widget>[
          // Header atau gambar/logo aplikasi dapat ditambahkan di sini
          // Misalnya:
          Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/b/b7/Google_Contacts_logo.png'),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Hubungi Kami',
                  style: TextStyle(fontSize: 20.0),
                ),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: messageController,
                  decoration: InputDecoration(labelText: 'Message'),
                  maxLines: 4,
                ),
                ElevatedButton(
                  onPressed: () {
                    _showAlertDialog(context);
                  },
                  child: Text('Kirim'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
