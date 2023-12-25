import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStorePostService {
  User? user = FirebaseAuth.instance.currentUser;
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('posts');
  Future<String> postThought(String message) async {
    await posts.add({
      'userEmail': user!.email,
      'post': message,
      'TimeStamp': Timestamp.now()
    });
    return 'Post Add successfully';
  }

  Stream<QuerySnapshot> getPostsStream() {
    final posstStream =
        posts.orderBy('TimeStamp', descending: true).snapshots();
    return posstStream;
  }
}
