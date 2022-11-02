import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:personal/features/authentication/application/base_authentication.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

abstract class GoogleAuthentication extends BaseAuthentication {
  factory GoogleAuthentication() => _GoogleAuthentication();

  GoogleSignInAccount? getCurrentUser();

  Future<AuthClient> getAuthClient();
}

class _GoogleAuthentication implements GoogleAuthentication {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      DriveApi.driveScope
    ],
  );

  @override
  Future<void> signIn() async {
    await googleSignIn.signIn();
  }

  @override
  Future<void> signOut() async {
    googleSignIn.disconnect();
  }

  @override
  Future<OAuthCredential> getOAuthCredential() async {
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignIn.currentUser?.authentication;

    return GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );
  }

  @override
  GoogleSignInAccount? getCurrentUser() {
    return googleSignIn.currentUser;
  }

  @override
  Future<AuthClient> getAuthClient() async {
    return (await googleSignIn.authenticatedClient())!;
  }

  @override
  Future<bool> isAuthenticated() async {
    if (await googleSignIn.isSignedIn() && googleSignIn.currentUser != null) {
      return true;
    }
    await googleSignIn.signInSilently();
    return await googleSignIn.isSignedIn() && googleSignIn.currentUser != null;
  }

  @override
  void registerInjectable() {
    serviceLocator.registerInjectable<GoogleAuthentication>(this);
  }
}
