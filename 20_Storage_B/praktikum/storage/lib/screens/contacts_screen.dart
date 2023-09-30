import 'package:flutter/material.dart';
import 'package:storage/screens/login_screen.dart';
import 'package:storage/utils/shared_preferences.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ambil username dari SharedPreferences
    final username = SharedPreferencesUtil.getUsername();

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Hapus data dari SharedPreferences dan kembali ke Login Screen
              SharedPreferencesUtil.clear();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome, $username!'),
            // Tampilkan daftar kontak di sini
          ],
        ),
      ),
    );
  }
}
