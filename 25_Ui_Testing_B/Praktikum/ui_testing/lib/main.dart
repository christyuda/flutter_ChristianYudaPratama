import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_testing/blocs/contact_form/contact_form_bloc.dart';
import 'package:ui_testing/blocs/contact_list/contact_list_bloc.dart';
import 'package:ui_testing/blocs/contact_list/contact_list_event.dart';
import 'package:ui_testing/screens/contact_form_screen.dart';
import 'package:ui_testing/screens/contact_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ContactFormBloc>(
            create: (context) => ContactFormBloc(),
          ),
          BlocProvider<ContactListBloc>(
            create: (context) => ContactListBloc()..add(LoadContacts()),
          ),
        ],
        child: ContactApp(),
      ),
    );
  }
}

class ContactApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contacts App'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Form'),
              Tab(text: 'List'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ContactFormScreen(),
            ContactListScreen(),
          ],
        ),
      ),
    );
  }
}
