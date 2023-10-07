import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restandmvvm/screens/login_page.dart';
import 'package:restandmvvm/viewmodels/login_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: MyApp(),
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
