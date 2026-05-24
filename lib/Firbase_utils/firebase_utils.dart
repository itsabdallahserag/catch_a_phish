import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseUtils {
  // Sign Up
  static Future<bool> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  // Login
  static Future<bool> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  static Future<bool> loginByGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) return false;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
  static Future<bool> loginByGitHub() async {
  try {
    final githubProvider = GithubAuthProvider();
    await FirebaseAuth.instance.signInWithProvider(githubProvider);
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}
}
