import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/bloc/contact_bloc.dart';
import 'package:test_bloc/screens/contact/contact_form.dart';
import 'package:test_bloc/screens/contact/contact_list.dart';
import 'package:test_bloc/screens/galeri/galeri_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Inisialisasi ContactBloc di level tertinggi aplikasi
  final ContactBloc contactBloc = ContactBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Contacts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/contact', // Rute awal aplikasi
      routes: {
        '/contact': (context) => ContactScreen(
              contactBloc: contactBloc,
            ), // Sediakan ContactBloc ke ContactScreen
        '/galeri': (context) => GaleriPage(),
      },
    );
  }
}

class ContactScreen extends StatelessWidget {
  final ContactBloc contactBloc;

  // Terima instance ContactBloc melalui konstruktor
  ContactScreen({required this.contactBloc});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Sediakan ContactBloc ke MultiBlocProvider
        BlocProvider<ContactBloc>(
          create: (BuildContext context) => contactBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
          centerTitle: true,
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Menu'),
              ),
              ListTile(
                title: Text('Contact'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/contact');
                },
              ),
              ListTile(
                title: Text('Galeri'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/galeri');
                },
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ContactForm(),
              ContactList(),
            ],
          ),
        ),
      ),
    );
  }
}
