import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restandmvvm/screens/home_page.dart';
import 'package:restandmvvm/screens/second_page.dart';
import 'package:restandmvvm/screens/third_page.dart';
import 'package:restandmvvm/viewmodels/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                await loginViewModel.login(
                  emailController.text, // Gunakan nilai dari controller
                  passwordController.text, // Gunakan nilai dari controller
                );
                if (loginViewModel.isLoggedIn) {
                  // Jika login berhasil, arahkan pengguna ke halaman selanjutnya (HomePage)
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          HomePage(), // Ganti dengan halaman selanjutnya
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
