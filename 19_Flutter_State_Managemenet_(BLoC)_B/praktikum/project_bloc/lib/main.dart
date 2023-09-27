import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Flutter Bloc
import 'package:project_bloc/blocs/contact_bloc.dart';
import 'package:project_bloc/pages/contact_page.dart';
import 'package:project_bloc/pages/galeri_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ContactBloc>(
          create: (context) => ContactBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/contact': (context) => ContactPage(
            contactBloc: context.read<
                ContactBloc>()), // Menggunakan context untuk mendapatkan instance ContactBloc
        '/galeri': (context) => GaleriPage(),
      },
      home: ContactPage(
          contactBloc: context.read<
              ContactBloc>()), // Menggunakan context untuk mendapatkan instance ContactBloc
    );
  }
}
