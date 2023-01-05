import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

final googleAuthProvider = Provider<GoogleAuth>(
  (ref) => _GoogleAuthImpl(),
);

abstract class GoogleAuth {
  Future<void> login();
  Future<void> logout();
  bool isAuthenticated();
  GoogleSignInAccount? getCurrentUser();
  Future<AuthClient?> getAuthClient();
}

class _GoogleAuthImpl implements GoogleAuth {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Future<void> login() async {
    if (await googleSignIn.signInSilently() == null) {
      await googleSignIn.signIn();
    }
  }

  @override
  Future<void> logout() async {
    await googleSignIn.disconnect();
  }

  @override
  bool isAuthenticated() {
    return googleSignIn.currentUser != null;
  }

  @override
  GoogleSignInAccount? getCurrentUser() {
    return googleSignIn.currentUser;
  }
  
  @override
  Future<AuthClient?> getAuthClient() {
    return googleSignIn.authenticatedClient();
  }
}
