import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:restandmvvm/bloc/contact_bloc.dart';
import 'package:restandmvvm/screens/login_page.dart';
import 'package:restandmvvm/viewmodels/contact_viewmodel.dart';
import 'package:restandmvvm/viewmodels/login_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider<ContactViewModel>(
          create: (context) => ContactViewModel(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ContactBloc>(
            create: (context) => ContactBloc(),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest And MVVM App',
      home: LoginView(),
    );
  }
}
