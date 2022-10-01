import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal/core/utils/singleton_utils.dart';

class GoogleAuthentication {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  static GoogleSignInAccount get account => SingletonUtils.getInstanceThrowInitError(_googleSignIn.currentUser);

  static Future<void> signIn() async {
    if (await _googleSignIn.signInSilently() == null) {
      await _googleSignIn.signIn();
    }
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
  }

  static Future<OAuthCredential> getAuthCredential() async {
    GoogleSignInAuthentication? googleSignInAuthentication =
        await _googleSignIn.currentUser?.authentication;

    return GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );
  }
}
