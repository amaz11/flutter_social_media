import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/firebase_options.dart';
import 'package:socialmedia/pages/auth.dart';
import 'package:socialmedia/pages/home_page.dart';
import 'package:socialmedia/pages/login_page.dart';
import 'package:socialmedia/pages/profile_page.dart';
import 'package:socialmedia/pages/user_page.dart';
import 'package:socialmedia/theme/dark_mode.dart';
import 'package:socialmedia/theme/light_mode.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social-Media',
      theme: lightMode,
      darkTheme: darkMode,
      home: const AuthPage(),
      routes: {
        '/login_Page': (context) => const LoginPage(),
        '/home_page': (context) => const HomePage(),
        '/profile_page': (context) => const ProfilePage(),
        '/users_page': (context) => const UserPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
