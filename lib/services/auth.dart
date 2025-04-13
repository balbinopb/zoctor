import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //sign in with email & password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  //Google Sign-in
  Future<User?> signInGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential result =
          await _firebaseAuth.signInWithCredential(credential);
      return result.user;
    } catch (e) {
      throw Exception("Google sign-in failed");
    }
  }

  //register with email & password
  Future<User?> registerWithEmailAndPassword(String email, String password, String displayName) async {
  final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  if (userCredential.user != null) {
    await userCredential.user!.updateProfile(displayName: displayName);
    return userCredential.user;
  }
  return null;
}


}
