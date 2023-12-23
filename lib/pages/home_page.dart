import 'package:flutter/material.dart';
import 'package:socialmedia/api/auth_service.dart';
import 'package:socialmedia/widget/mydrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                FireBaseAuthService().signOut();
              },
              child: const Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: const Center(child: Text("Home page")),
      drawer: const MyDrawer(),
    );
  }
}
