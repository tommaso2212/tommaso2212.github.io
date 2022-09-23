import 'package:firebase_auth/firebase_auth.dart';

import 'authentication.dart';

abstract class AuthenticationProvider implements Authentication{

  Future<AuthCredential> get authCredential;
}