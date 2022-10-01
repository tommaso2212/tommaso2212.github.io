import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal/core/authentication/google_authentication.dart';
import 'package:personal/core/utils/singleton_utils.dart';

class FirebaseAuthentication {

  static FirebaseAuth? _account;

  static FirebaseAuth get account => SingletonUtils.getInstanceThrowInitError(_account);

  static Future<void> login() async {
    await GoogleAuthentication.signIn();

     await FirebaseAuth.instance
        .signInWithCredential(await GoogleAuthentication.getAuthCredential());
  }

  static Future<void> logout() async {
    await account.signOut();
    await GoogleAuthentication.signOut();
  }
}
