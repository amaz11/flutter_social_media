import 'package:flutter/material.dart';
import 'package:socialmedia/api/auth_service.dart';
import 'package:socialmedia/pages/home_page.dart';
import 'package:socialmedia/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FireBaseAuthService().authStateChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
