import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:test_bloc/bloc/contact_bloc.dart';
import 'package:test_bloc/screens/contact/contact_form.dart';
import 'package:test_bloc/screens/galeri/galeri_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ContactBloc(),
      child: MaterialApp(
        routes: {
          '/contact': (context) => MyHomePage(),
          '/galeri': (context) => GaleriPage(),
        },
        home: MyHomePage(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Contact App',
      home: BlocProvider<ContactBloc>(
        create: (context) => ContactBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactForm(),
    );
  }
}
