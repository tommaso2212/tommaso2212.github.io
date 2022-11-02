import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal/features/authentication/application/base_authentication.dart';
import 'package:personal/features/authentication/application/google_authentication.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

abstract class FirebaseAuthentication extends BaseAuthentication {
  static const String name = 'firebase_authentication';

  factory FirebaseAuthentication() => _FirebaseAuthentication();

  User? getCurrentUser();
}

class _FirebaseAuthentication implements FirebaseAuthentication {
  late OAuthCredential _credential;

  @override
  Future<OAuthCredential> getOAuthCredential() async {
    return _credential;
  }

  @override
  Future<void> signIn() async {
    var googleAuth = serviceLocator<GoogleAuthentication>();
    await googleAuth.signIn();
    _credential = await googleAuth.getOAuthCredential();

    FirebaseAuth.instance.signInWithCredential(_credential);
  }

  Future<bool> signInSilently() async {
    var googleAuth = serviceLocator<GoogleAuthentication>();

    if (await googleAuth.isAuthenticated()) {
      _credential = await googleAuth.getOAuthCredential();
      await FirebaseAuth.instance.signInWithCredential(_credential);
      return true;
    }
    return false;
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await serviceLocator<GoogleAuthentication>().signOut();
  }

  @override
  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  void registerInjectable() {
    serviceLocator.registerInjectable<FirebaseAuthentication>(this);
  }

  @override
  Future<bool> isAuthenticated() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    return await signInSilently();
  }
}
