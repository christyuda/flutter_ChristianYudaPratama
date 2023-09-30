import 'package:flutter/material.dart';
import 'package:storage/screens/contacts_screen.dart';
import 'package:storage/screens/login_screen.dart';
import 'package:storage/utils/shared_preferences.dart';

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
      home: FutureBuilder<String?>(
        future: SharedPreferencesUtil.getUsername(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final username = snapshot.data;

            return username != null && username.isNotEmpty
                ? ContactsScreen()
                : LoginScreen();
          } else {
            return CircularProgressIndicator(); // Menampilkan indikator loading sementara data dimuat.
          }
        },
      ),
    );
  }
}
