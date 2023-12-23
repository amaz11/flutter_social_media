import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService {
  final FirebaseAuth _authService = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get authStateChange => _authService.authStateChanges();
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<String?> signUP(
      {required String email,
      required String password,
      required String name}) async {
    try {
      UserCredential? userCredential = await _authService
          .createUserWithEmailAndPassword(email: email, password: password);
      storeUsers(userCredential, name);
      return "Sing-UP successfully.";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _authService.signInWithEmailAndPassword(
          email: email, password: password);
      return "Login successful";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }

  Future<void> storeUsers(UserCredential? userCredential, String name) async {
    if (userCredential != null && userCredential.user != null) {
      await _firestore
          .collection('users')
          .doc(userCredential.user!.email)
          .set({"email": userCredential.user!.email, "name": name});
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await _firestore.collection('users').doc(currentUser!.email).get();
  }
}
