import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal/utils/service_locator/injectable/base_injectable.dart';

abstract class BaseAuthentication extends BaseInjectable{

  Future<void> signIn();

  Future<void> signOut();

  Future<OAuthCredential> getOAuthCredential();

  Future<bool> isAuthenticated();
}
