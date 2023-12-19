import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService {
  final FirebaseAuth _authService = FirebaseAuth.instance;
  Stream<User?> get authStateChange => _authService.authStateChanges();
  Future<String?> signUP(
      {required String email, required String password}) async {
    try {
      await _authService.createUserWithEmailAndPassword(
          email: email, password: password);
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
}
