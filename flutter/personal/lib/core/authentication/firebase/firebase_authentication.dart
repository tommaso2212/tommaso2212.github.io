import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal/core/authentication/authentication.dart';
import 'package:personal/core/authentication/authentication_provider.dart';
import 'package:personal/core/authentication/firebase/firestore_authentication.dart';

class FirebaseAuthentication implements Authentication {

  final AuthenticationProvider authenticationProvider;

  static FirebaseAuthentication? _instance;

  static FirebaseAuthentication get instance => _instance!;

  FirebaseAuthentication(this.authenticationProvider){
    _instance = this;
  }

  @override
  Future<bool> get isSignedIn =>
      Future.value(Authentication.user.firebaseSignInAccount != null);

  @override
  Future<void> login() async {
    await authenticationProvider.login();

    Authentication.user.firebaseSignInAccount = await FirebaseAuth.instance
        .signInWithCredential(await authenticationProvider.authCredential);

    await FirestoreAuthentication().login();
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Authentication.user.firebaseSignInAccount = null;
    await authenticationProvider.logout();
    await FirestoreAuthentication().logout(); 
  }
}
