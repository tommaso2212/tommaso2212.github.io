import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal/authentication/authentication.dart';
import 'package:personal/authentication/google/google_authentication.dart';

class FirebaseAuthentication extends Authentication{

  static UserCredential? userCredential;

  @override
  Future<bool> get isSignedIn => Future.value(userCredential != null);

  @override
  Future<void> login() async {
    GoogleAuthentication().login();

    GoogleSignInAuthentication? googleSignInAuthentication = await Authentication.user.googleSignInAccount?.authentication;

    Authentication.user.firebaseSignInAccount = await FirebaseAuth.instance.signInWithCredential(GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken
    ));
  }

  @override
  void logout() {
    FirebaseAuth.instance.signOut();
  }

}