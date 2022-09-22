import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal/authentication/authentication.dart';

class GoogleAuthentication extends Authentication {

  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Future<void> login() async {
    await _googleSignIn.signIn();

    Authentication.user.googleSignInAccount = _googleSignIn.currentUser;
  }
  
  @override
  void logout() {
    if(_googleSignIn.currentUser!=null){
      _googleSignIn.signOut();
    }
  }
  
  @override
  Future<bool> get isSignedIn => _googleSignIn.isSignedIn();
}
