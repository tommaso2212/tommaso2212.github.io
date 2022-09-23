import 'package:personal/core/authentication/model/user.dart';

abstract class Authentication {

  static final User user = User();

  Future<void> login();

  Future<void> logout();

  Future<bool> get isSignedIn;
}

