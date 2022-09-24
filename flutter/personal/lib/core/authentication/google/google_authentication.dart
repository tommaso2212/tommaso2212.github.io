import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal/core/authentication/authentication.dart';
import 'package:personal/core/authentication/authentication_provider.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

class GoogleAuthentication extends AuthenticationProvider {

  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Future<void> login() async {
    if(await _googleSignIn.signInSilently() == null){
      await _googleSignIn.signIn();
    }
    Authentication.user.googleSignInAccount = _googleSignIn.currentUser;
  }
  
  @override
  Future<void> logout() async {
    if(_googleSignIn.currentUser!=null){
      await _googleSignIn.signOut();
    }
    Authentication.user.googleSignInAccount = null;
  }
  
  @override
  Future<bool> get isSignedIn => _googleSignIn.isSignedIn();

  @override
  Future<AuthCredential> createAuthCredential() async {
    GoogleSignInAuthentication? googleSignInAuthentication =
        await Authentication.user.googleSignInAccount?.authentication;

    return GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication?.accessToken,
            idToken: googleSignInAuthentication?.idToken);
  }
}
