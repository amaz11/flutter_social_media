import 'package:flutter/material.dart';
import 'package:socialmedia/api/auth_service.dart';
import 'package:socialmedia/api/post_service.dart';
import 'package:socialmedia/widget/mydrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _postController = TextEditingController();

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Expanded(
                  // width: 280,
                  child: TextField(
                    controller: _postController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Write Something'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    const snackBar = SnackBar(
                      content: Text('Post Add successfully'),
                    );

                    if (_postController.text.isNotEmpty) {
                      FireStorePostService()
                          .postThought(_postController.text)
                          .then((value) => ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar));
                    }
                    _postController.clear();
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(25)),
                  ),
                  child: const Icon(Icons.check),
                ),
              ],
            ),
          ),
          StreamBuilder(
              stream: FireStorePostService().getPostsStream(),
              builder: (context, snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshots.hasError) {
                  return const Text("Somethiong went error");
                } else {
                  final posts = snapshots.data!.docs;

                  if (snapshots.data == null || posts.isEmpty) {
                    return const Text("No data here");
                  }

                  return Expanded(
                    child: ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];

                          return ListTile(
                            title: Text(post["post"]),
                            subtitle: Text(post["userEmail"]),
                          );
                        }),
                  );
                }
              })
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
