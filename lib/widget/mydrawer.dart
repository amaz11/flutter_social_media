import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(children: [
        const DrawerHeader(
          child: Icon(
            Icons.telegram,
            size: 30,
            color: Colors.blue,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          title: const Text("H O M E"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/home_page');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.person,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          title: const Text("P R O F I L"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/profile_page");
          },
        ),
        ListTile(
          leading: Icon(
            Icons.people,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          title: const Text("U S E R"),
          onTap: () {
            Navigator.pop(context);

            Navigator.pushNamed(context, "/users_page");
          },
        ),
      ]),
    );
  }
}
